(function(funcName, baseObj) {
    // The public function name defaults to window.docReady
    // but you can pass in your own object and own function name and those will be used
    // if you want to put them in a different namespace
    funcName = funcName || "docReady";
    baseObj = baseObj || window;
    var readyList = [];
    var readyFired = false;
    var readyEventHandlersInstalled = false;

    // call this when the document is ready
    // this function protects itself against being called more than once
    function ready() {
        if (!readyFired) {
            // this must be set to true before we start calling callbacks
            readyFired = true;
            for (var i = 0; i < readyList.length; i++) {
                // if a callback here happens to add new ready handlers,
                // the docReady() function will see that it already fired
                // and will schedule the callback to run right after
                // this event loop finishes so all handlers will still execute
                // in order and no new ones will be added to the readyList
                // while we are processing the list
                readyList[i].fn.call(window, readyList[i].ctx);
            }
            // allow any closures held by these functions to free
            readyList = [];
        }
    }

    function readyStateChange() {
        if ( document.readyState === "complete" ) {
            ready();
        }
    }

    // This is the one public interface
    // docReady(fn, context);
    // the context argument is optional - if present, it will be passed
    // as an argument to the callback
    baseObj[funcName] = function(callback, context) {
        if (typeof callback !== "function") {
            throw new TypeError("callback for docReady(fn) must be a function");
        }
        // if ready has already fired, then just schedule the callback
        // to fire asynchronously, but right away
        if (readyFired) {
            setTimeout(function() {callback(context);}, 1);
            return;
        } else {
            // add the function and context to the list
            readyList.push({fn: callback, ctx: context});
        }
        // if document already ready to go, schedule the ready function to run
        if (document.readyState === "complete") {
            setTimeout(ready, 1);
        } else if (!readyEventHandlersInstalled) {
            // otherwise if we don't have event handlers installed, install them
            if (document.addEventListener) {
                // first choice is DOMContentLoaded event
                document.addEventListener("DOMContentLoaded", ready, false);
                // backup is window load event
                window.addEventListener("load", ready, false);
            } else {
                // must be IE
                document.attachEvent("onreadystatechange", readyStateChange);
                window.attachEvent("onload", ready);
            }
            readyEventHandlersInstalled = true;
        }
    }
})("docReady", window);


(function() {

  class GlobalModal {
    constructor() {
      const modal = document.createElement("div");
      modal.classList.add("modal", "fade");
      modal.id = "rave-global-modal";
      modal.setAttribute("data-bs-backdrop", "static");
      modal.setAttribute("data-bs-keyboard", "false");
      modal.setAttribute("tabindex", "-1");
      modal.setAttribute("aria-labelledby", "rave-global-modal-label");
      modal.setAttribute("aria-hidden", "true");

      const modalDialog = document.createElement("div");
      modalDialog.classList.add("modal-dialog", "modal-dialog-centered", "modal-dialog-scrollable", "modal-fullscreen-xl-down", "modal-xl");

      const modalContent = document.createElement("div");
      modalContent.classList.add("modal-content");

      const modalHeader = document.createElement("div");
      modalHeader.classList.add("modal-header");

      const modalTitle = document.createElement("div");
      modalTitle.classList.add("modal-title", "fs-5");
      modalTitle.id = "rave-global-modal-label";

      const modalTopRightBtn = document.createElement("button");
      modalTopRightBtn.classList.add("btn-close");
      modalTopRightBtn.setAttribute("type", "button");
      modalTopRightBtn.setAttribute("data-bs-dismiss", "modal");
      modalTopRightBtn.setAttribute("aria-label", "Close");

      modalHeader.appendChild(modalTitle);
      modalHeader.appendChild(modalTopRightBtn);
      modalContent.appendChild(modalHeader);

      const modalBody = document.createElement("div");
      modalBody.classList.add("modal-body");

      const modalBodyContainer = document.createElement("div");
      modalBodyContainer.classList.add("container-fluid");

      const modalBodyRow = document.createElement("div");
      modalBodyRow.classList.add("row");

      const modalBodyInner = document.createElement("div");
      modalBodyInner.classList.add("col-sm-12");

      modalBodyRow.appendChild(modalBodyInner);
      modalBodyContainer.appendChild(modalBodyRow);
      modalBody.appendChild(modalBodyContainer);
      modalContent.appendChild(modalBody);

      const modalFooter = document.createElement("div");
      modalFooter.classList.add("modal-footer");

      const modalFooterBtn = document.createElement("button");
      modalFooterBtn.classList.add("btn", "btn-primary");
      modalFooterBtn.setAttribute("type", "button");
      modalFooterBtn.setAttribute("data-bs-dismiss", "modal");
      modalFooterBtn.innerHTML = "Done!";

      modalFooter.appendChild(modalFooterBtn);
      modalContent.appendChild(modalFooter);

      modalDialog.appendChild(modalContent);
      modal.appendChild(modalDialog);

      document.body.appendChild(modal);

      this.$modal = modal;
      this.$title = modalTitle;
      this.$body = modalBodyInner;

      this.object = new bootstrap.Modal(modal);
    }

    show({ title, content }) {
      this.$title.innerHTML = title;

      if( typeof content === "string" ) {
        this.$body.innerHTML = content;
      } else {
        this.$body.innerHTML = "";
        this.$body.appendChild( content );
      }


      this.object.show();
    }

  }

  docReady(function() {
    const raveModal = new GlobalModal();

    // query .rave-modal
    const modalContents = document.querySelectorAll(".rave-modal");

    modalContents.forEach(modalContent => {
      const cls = modalContent.getAttribute("data-class") || "";
      let text = modalContent.getAttribute("data-label");
      if( typeof text !== "string" || text.length === 0 ) {
        text = "(No `data-label`)";
      }
      let title = modalContent.getAttribute("data-title");
      if( typeof title !== "string" || title.length === 0 ) {
        title = "(No `data-title`)";
      }


      const btn = document.createElement("botton");
      btn.className = `btn ${cls}`;
      btn.setAttribute("type", "button");
      btn.innerHTML = text;

      btn.addEventListener("click", () => {
        raveModal.show({
          title: title,
          content: modalContent,
        });
      });

      modalContent.replaceWith(btn);
    });
  })

})();