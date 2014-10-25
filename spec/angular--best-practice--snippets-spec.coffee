{WorkspaceView} = require 'atom'
Angular-estPractice-nippets = require '../lib/angular--best-practice--snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Angular-estPractice-nippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('angular--best-practice--snippets')

  describe "when the angular--best-practice--snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.angular--best-practice--snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'angular--best-practice--snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.angular--best-practice--snippets')).toExist()
        atom.workspaceView.trigger 'angular--best-practice--snippets:toggle'
        expect(atom.workspaceView.find('.angular--best-practice--snippets')).not.toExist()
