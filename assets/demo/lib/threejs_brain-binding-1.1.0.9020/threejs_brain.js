// Wrap up the whole script within a function
+(function(){
})();

/**
 *  threeBrain = {
      ViewerApp : BrainCanvas
      ViewerWrapper : ViewerWrapper,
      StorageCache : StorageCache
    }
  */

// This is a global cache that is shared across the widgets.
window.global_cache = window.global_cache || new threeBrain.StorageCache();
window.THREE = threeBrain.ExternLibs.THREE;

HTMLWidgets.widget({

  name: "threejs_brain",

  type: "output",

  factory: function( el , width , height) {

    const widget = new threeBrain.ViewerWrapper({
      $container : el, cache : global_cache,
      width : width, height : height,
      viewerMode : HTMLWidgets.viewerMode
    });

    let demoReady = false;
    let widgetWidth = width || 100;

    const pauseDemo = () => {
      if( !widget.viewer.ready ) {
        console.log("Viewer not ready yet.");
        setTimeout(pauseDemo, 2000);
        return;
      }
      if( !demoReady ) {
        demoReady = true;
        console.log("Viewer is (just) ready... pausing demo.");
        setTimeout(pauseDemo, 2000);
        return;
      }
      try {
        widget.viewer.pauseDemo();
        console.log("Viewer paused.");
      } catch (error) {
        console.warn(error);
      }
    };

    const render = ( v ) => {
      const doRender = async () => {
        widget.receiveData({ data : v, reset : false });
        if( HTMLWidgets.shinyMode && !widget.viewer.shinyDriver ) {
          widget.viewer.shinyDriver = new threeBrain.Drivers.Shiny( widget.viewer );
        }
        try {
          if( widgetWidth < 600 ) {
            pauseDemo();
          }
        } catch (error) {
          console.warn(error);
        }
      };
      const renderLater = () => {
        if( widgetWidth < 600 ) {
          setTimeout(renderLater, 2000);
          return;
        }
        doRender();
      };
      renderLater();
    }

    return {
      // "find", "renderError", "clearError", "sizing", "name", "type", "initialize", "renderValue", "resize"

      renderValue: (v) => {
        render( v );
      },

      resize: (width, height) => {
        widgetWidth = width;
        widget.resize(width, height);
        try {
          if( width < 600 ) {
            pauseDemo();
          } else {
            widget.viewer.resumeDemo();
          }
        } catch (error) {}
      }
    };
  }
});


