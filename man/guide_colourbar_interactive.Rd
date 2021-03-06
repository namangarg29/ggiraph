% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/guide_colourbar_interactive.R
\name{guide_colourbar_interactive}
\alias{guide_colourbar_interactive}
\alias{guide_colorbar_interactive}
\title{Create interactive continuous colour bar guide}
\usage{
guide_colourbar_interactive(...)

guide_colorbar_interactive(...)
}
\arguments{
\item{...}{arguments passed to base function.}
}
\value{
An interactive guide object.
}
\description{
The guide is based on \code{\link[ggplot2]{guide_colourbar}}.
See the documentation for that function for more details.
}
\section{Details for scale_*_interactive and guide_*_interactive functions}{

For scales, the interactive parameters can be supplied as arguments in the relevant function
and they can be scalar values or vectors, depending on the number of breaks (levels) and
the type of the guide used.
The guides do not accept any interactive parameter directly, they receive them from the scales.

\itemize{
  \item When guide of type `legend` is used, it will be converted to a
  \code{\link{guide_legend_interactive}} if it's not already.

  The length of each scale interactive parameter vector should match the length of the breaks.
  It can also be a named vector, where each name should correspond to the same break name.
  It can also be defined as function that takes the breaks as input and returns a named or
  unnamed vector of values as output.

  The interactive parameters here, give interactivity only to the key elements of the guide.

  \item When guide of type `colourbar` is used, it will be converted to a
  \code{\link{guide_colourbar_interactive}} if it's not already.

  The scale interactive parameters in this case should be scalar values and give interactivity
  to the colorbar only.
}

To provide interactivity to the rest of the elements of a guide, (title, labels, background, etc),
the relevant theme elements or relevant guide arguments can be used.
The \code{guide} arguments `title.theme` and `label.theme` can be defined as
\code{element_text_interactive} (in fact, they will be converted to that if they are not
already), either directly or via the theme.
See the element_*_interactive section for more details.
}

\examples{
# add interactive colourbar guide to a ggplot -------
library(ggplot2)
library(ggiraph)

df <- expand.grid(x = 0:5, y = 0:5)
df$z <- runif(nrow(df))

p <- ggplot(df, aes(x, y, fill = z, tooltip = "tooltip")) +
  geom_raster_interactive()

# add an interactive scale (guide is colourbar)
p1 <- p + scale_fill_gradient_interactive(data_id = "colourbar",
                                          onclick = "alert(\"colourbar\")",
                                          tooltip = "colourbar")
x <- girafe(ggobj = p1)
if (interactive()) print(x)

# make the legend title interactive
p2 <- p + scale_fill_gradient_interactive(
  data_id = "colourbar",
  onclick = "alert(\"colourbar\")",
  tooltip = "colourbar",
  name = label_interactive(
    "z",
    data_id = "colourbar",
    onclick = "alert(\"colourbar\")",
    tooltip = "colourbar"
  )
)
x <- girafe(ggobj = p2)
x <- girafe_options(x,
                    opts_hover_key(girafe_css("stroke:red", text="stroke:none;fill:red")))
if (interactive()) print(x)

# make the legend labels interactive
p3 <- p + scale_fill_gradient_interactive(
  data_id = "colourbar",
  onclick = "alert(\"colourbar\")",
  tooltip = "colourbar",
  name = label_interactive(
    "z",
    data_id = "colourbar",
    onclick = "alert(\"colourbar\")",
    tooltip = "colourbar"
  ),
  labels = function(breaks) {
    lapply(breaks, function(br) {
      label_interactive(
        as.character(br),
        data_id = "colourbar",
        onclick = "alert(\"colourbar\")",
        tooltip = "colourbar"
      )
    })
  }
)
x <- girafe(ggobj = p3)
x <- girafe_options(x,
                    opts_hover_key(girafe_css("stroke:red", text="stroke:none;fill:red")))
if (interactive()) print(x)

# also via the guide
p4 <- p + scale_fill_gradient_interactive(
  data_id = "colourbar",
  onclick = "alert(\"colourbar\")",
  tooltip = "colourbar",
  guide = guide_colourbar_interactive(
    title.theme = element_text_interactive(
      size = 8,
      data_id = "colourbar",
      onclick = "alert(\"colourbar\")",
      tooltip = "colourbar"
    ),
    label.theme = element_text_interactive(
      size = 8,
      data_id = "colourbar",
      onclick = "alert(\"colourbar\")",
      tooltip = "colourbar"
    )
  )
)
x <- girafe(ggobj = p4)
x <- girafe_options(x,
                    opts_hover_key(girafe_css("stroke:red", text="stroke:none;fill:red")))
if (interactive()) print(x)

# make the legend background interactive
p5 <- p4 + theme(
  legend.background = element_rect_interactive(
    data_id = "colourbar",
    onclick = "alert(\"colourbar\")",
    tooltip = "colourbar"
  )
)
x <- girafe(ggobj = p5)
x <- girafe_options(x,
                    opts_hover_key(girafe_css("stroke:red", text="stroke:none;fill:red")))
if (interactive()) print(x)
}
\seealso{
\code{\link{interactive_parameters}}

\code{\link{girafe}}
}
