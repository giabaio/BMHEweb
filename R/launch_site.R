#'
#' Launch the local version of the website
#'
#' Just run the command \code{launch_site()} to open a local version of the
#' course website
#'
launch_site=function(){
  servr::httd(system.file("public",package="bmheWeb"))
}
