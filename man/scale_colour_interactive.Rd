% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_colour_interactive.R
\name{scale_colour_interactive}
\alias{scale_colour_interactive}
\alias{scale_colour_continuous_interactive}
\alias{scale_color_continuous_interactive}
\alias{scale_fill_continuous_interactive}
\alias{scale_colour_grey_interactive}
\alias{scale_color_grey_interactive}
\alias{scale_fill_grey_interactive}
\alias{scale_colour_hue_interactive}
\alias{scale_color_hue_interactive}
\alias{scale_fill_hue_interactive}
\title{Create interactive colour scales}
\usage{
scale_colour_continuous_interactive(...)

scale_color_continuous_interactive(...)

scale_fill_continuous_interactive(...)

scale_colour_grey_interactive(...)

scale_color_grey_interactive(...)

scale_fill_grey_interactive(...)

scale_colour_hue_interactive(...)

scale_color_hue_interactive(...)

scale_fill_hue_interactive(...)
}
\arguments{
\item{...}{arguments passed to base function,
plus any of the \code{\link{interactive_parameters}}.}
}
\value{
An interactive scale object.
}
\description{
These scales are based on
\code{\link[ggplot2]{scale_colour_continuous}},
\code{\link[ggplot2]{scale_fill_continuous}},
\code{\link[ggplot2]{scale_colour_grey}},
\code{\link[ggplot2]{scale_fill_grey}},
\code{\link[ggplot2]{scale_colour_hue}} and
\code{\link[ggplot2]{scale_fill_hue}}.
See the documentation for those functions for more details.
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

\seealso{
\code{\link{girafe}}

Other interactive scale: 
\code{\link{scale_alpha_interactive}()},
\code{\link{scale_colour_brewer_interactive}()},
\code{\link{scale_gradient_interactive}},
\code{\link{scale_linetype_interactive}()},
\code{\link{scale_manual_interactive}},
\code{\link{scale_shape_interactive}()},
\code{\link{scale_size_interactive}()},
\code{\link{scale_viridis_interactive}}
}
\concept{interactive scale}
