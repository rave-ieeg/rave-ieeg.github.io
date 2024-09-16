abstracts <- list(
  list(
    title = "RAVE: Comprehensive open-source software for reproducible analysis and visualization of intracranial EEG data",
    authors = c(
      "John F. Magnotti",
      "Zhengjia Wang",
      "Michael S. Beauchamp"
    ),
    journal = "NeuroImage",
    date = "Dec 2020",
    thumbnail = "rave-neuroimage.webp",
    doi = "10.1016/j.neuroimage.2020.117341"
  ),
  list(
    title = "YAEL: Your Advanced Electrode Localizer",
    authors = c(
      "Zhengjia Wang",
      "John F. Magnotti",
      "Xiang Zhang",
      "Michael S. Beauchamp"
    ),
    journal = "eNeuro",
    date = "Oct 2023",
    thumbnail = "YAEL_eneuro.jpg",
    doi = "10.1523/ENEURO.0328-23.2023"
  ),
  list(
    title = "Beta activity in human anterior cingulate cortex mediates reward biases",
    authors = c(
      "Jiayang Xiao, Joshua A. Adkinson, John Myers, Anusha B. Allawala, Raissa K. Mathura, Victoria Pirtle, Ricardo Najera, Nicole R. Provenza, Eleonora Bartoli, Andrew J. Watrous, Denise Oswalt, Ron Gadot, Adrish Anand, Ben Shofty, Sanjay J. Mathew, Wayne K. Goodman, Nader Pouratian, Xaq Pitkow, Kelly R. Bijanki, Benjamin Hayden, and Sameer A. Sheth"
    ),
    journal = "Nature Communications",
    date = "July 2024",
    thumbnail = "xiao.webp",
    doi = "10.1038/s41467-024-49600-7"
  ),
  list(
    title = "Bayesian Image-on-Scalar Regression with a Spatial Global-Local Spike-and-Slab Prior",
    authors = c(
      "Zijian Zeng, Meng Li, and Marina Vannucci "
    ),
    journal = "Bayesian Analysis",
    date = "Mar 2024",
    doi = "10.1016/j.brs.2022.03.002",
    thumbnail = "Zijian.png"
  ),
  list(
    title = "Intracranial stimulation and EEG feature analysis reveal affective salience network specialization",
    authors = c(
      "Brian A. Metzger, Prathik Kalva, Madaline M. Mocchi, Brian Cui, and Joshua A. Adkinson, Zhengjia Wang, Raissa Mathura, Kourtney Kanja, Jay Gavvala, Vaishnav Krishnan, Lu Lin, Atul Maheshwari, Ben Shofty, John F. Magnotti, Jon T. Willie, Sameer A. Sheth, Kelly R. Bijanki"
    ),
    journal = "Brain: A Journal of Neurology",
    date = "Oct 2023",
    doi = "10.1093/brain/awad200",
    thumbnail = "awad200f3.jpg"
  ),
  list(
    title = "Functional group bridge for simultaneous regression and support estimation",
    authors = c(
      "Zhengjia Wang, John Magnotti, Michael S. Beauchamp, and Meng Li"
    ),
    journal = "Biometrics",
    date = "Jun 2023",
    doi = "10.1111/biom.13684",
    thumbnail = "https://raw.githubusercontent.com/dipterix/spfda/master/inst/cover.png"
  ),
  list(
    title = "Imaging versus electrographic connectivity in human mood-related fronto-temporal networks",
    authors = c(
      "Joshua A. Adkinson, Evangelia Tsolaki, Sameer A. Sheth, Brian A. Metzger, and Meghan E. Robinson, Denise Oswalt, Cameron C. McIntyre, Raissa K. Mathura, Allison C. Waters, Anusha B. Allawala, Angela M. Noecker, Mahsa Malekmohammadi, Kevin Chiu, Richard Mustakos, Wayne Goodman, David Borton, Nader Pouratian, Kelly R. Bijanki"
    ),
    journal = "Brain Stimulation",
    date = "May 2022",
    doi = "10.1016/j.brs.2022.03.002",
    thumbnail = "nihms-1793961-f0002.jpg"
  ),
  list(
    title = "Responses to Visual Speech in Human Posterior Superior Temporal Gyrus Examined with iEEG Deconvolution",
    authors = c(
      "Brian A. Metzger, John F. Magnotti, Zhengjia Wang, Elizabeth Nesbitt, and Patrick J. Karas, Daniel Yoshor, Michael S. Beauchamp "
    ),
    journal = "The Journal of Neuroscience: The Official Journal of the Society for Neuroscience",
    date = "Sep 2020",
    doi = "10.1523/JNEUROSCI.0279-20.2020",
    thumbnail = "SN-JNSJ200361F003.jpg"
  ),
  list(
    title = "The visual speech head start improves perception and reduces superior temporal cortex responses to auditory speech",
    authors = c(
      " Patrick J Karas, John F Magnotti, Brian A Metzger, Lin L Zhu, and Kristen B Smith, Daniel Yoshor, Michael S Beauchamp "
    ),
    journal = "eLife",
    date = "Aug 2019",
    doi = "10.7554/eLife.48116",
    thumbnail = "elife-48116-fig3.jpg"
  )
)





abstract_html <- lapply(abstracts, function(item) {
  authors <- item$authors
  if(length(authors) > 1) {
    authors <- paste0(
      paste(authors[-length(authors)], collapse = ", "),
      ", and ", authors[[length(authors)]]
    )
  }
  doi <- paste(item$doi, collapse = "")
  if(!length(doi) || !nzchar(doi)) {
    doi <- NULL
  }

  htmltools::div(
    class = "grid abstract-item",
    htmltools::div(
      class = "g-col-12 g-col-md-2 abbr",
      if(length(item$thumbnail)) {
        htmltools::div(
          class="figure",
          htmltools::img(
            class = "preview z-depth-1 rounded w-100 placeholder placeholder-glow",
            `data-src` = ifelse(
              startsWith(item$thumbnail, "http"),
              item$thumbnail,
              sprintf("images/abstracts/%s", item$thumbnail)
            ),
            alt = "",
            loading="lazy"
          )
        )
      }
    ),
    htmltools::div(
      class = "g-col-12 g-col-md-10 g-col-lg-8",
      htmltools::div(class="title", item$title),
      htmltools::div(class="author", authors),
      htmltools::div(class="periodical", htmltools::tags$em(item$journal), ", ", item$date),
      htmltools::div(
        class="links",

        if(!is.null(doi)) {
          htmltools::a(
            class="btn btn-sm z-depth-0",
            role="button", rel="external nofollow noopener", target="_blank",
            href=sprintf("https://doi.org/%s", doi),
            htmltools::tags$i(class="ai ai-1x ai-doi"),
            sprintf("DOI: %s", doi)
          )
        }

      )
    )
  )
})

htmltools::div(
  class="publications",
  htmltools::div(
    class="bibliography",
    abstract_html
  )
)
