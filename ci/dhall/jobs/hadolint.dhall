let GitHubActions = (../imports.dhall).GitHubActions

let Setup = ../setup.dhall

in  Setup.MakeJob
      Setup.JobArgs::{
      , name = "hadolint"
      , additionalSteps =
        [ GitHubActions.Step::{
          , name = Some "Lint Dockefiles"
          , run = Some "just lint-docker"
          }
        ]
      }
