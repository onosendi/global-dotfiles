return {
  lintCommand = 'eslint_d --stdin --stdin-filename ${INPUT} -f visualstudio',
  lintStdin = true,
  lintIgnoreExitCode = true,
  lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
}
