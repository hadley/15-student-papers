cat_and_eval <- function(mystr, env = parent.frame()) {
  cat(mystr)
  eval(parse(text = mystr), envir = env)
}

cat_and_eval(paste0("t.test(", "mtcars", "$", "cyl, conf.level = ", 0.05, ")"))

as_call <- function(x) {
  if (inherits(x, "formula")) {
    stopifnot(length(x) == 2)
    x[[2]]
  } else if (is.atomic(x) || is.name(x) || is.call(x)) {
    x
  } else {
    stop("Unknown input")
  }
}

interpolate <- function(code, ..., `_env` = parent.frame()) {
  args <- lapply(list(...), as_call)
  expr <- methods::substituteDirect(as_call(code), args)
  print(expr)
  message("-----------------")
  eval(expr, `_env`)
}

interpolate(
  ~t.test(df$var, conf.level = conf),
  df = ~mtcars,
  var = ~cyl,
  conf = 0.05
)
