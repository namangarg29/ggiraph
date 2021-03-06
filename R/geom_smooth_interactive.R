#' @title Create interactive smoothed conditional means
#'
#' @description
#' The geometry is based on \code{\link[ggplot2]{geom_smooth}}.
#' See the documentation for those functions for more details.
#'
#' @param ... arguments passed to base function,
#' plus any of the \code{\link{interactive_parameters}}.
#' @inheritSection interactive_parameters Details for geom_*_interactive functions
#' @examples
#' # add interactive bar -------
#' @example examples/geom_smooth_interactive.R
#' @seealso \code{\link{girafe}}
#' @export
geom_smooth_interactive <- function(...)
  layer_interactive(geom_smooth, ...)

#' @rdname ggiraph-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomInteractiveSmooth <- ggproto(
  "GeomInteractiveSmooth",
  GeomSmooth,
  default_aes = add_default_interactive_aes(GeomSmooth),
  draw_key = function(data, params, size) {
    gr <- GeomSmooth$draw_key(data, params, size)
    add_interactive_attrs(gr, data, data_attr = "key-id")
  },
  draw_group = function(data, panel_params, coord, se = FALSE) {
    ribbon <- transform(data, colour = NA)
    path <- transform(data, alpha = NA)

    has_ribbon <- se && !is.null(data$ymax) && !is.null(data$ymin)

    gList(
      if (has_ribbon) GeomInteractiveRibbon$draw_group(ribbon, panel_params, coord),
      GeomInteractiveLine$draw_panel(path, panel_params, coord)
    )
  }
)
