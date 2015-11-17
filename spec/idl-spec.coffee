describe 'IDL grammar', ->
    grammar = null

    beforeEach ->
        waitsForPromise ->
            atom.packages.activatePackage 'language-idl'

        runs ->
            grammar = atom.grammars.grammarForScopeName 'source.idl'

    it 'parses the grammar', ->
        expect(grammar).toBeTruthy()
        expect(grammar.scopeName).toBe 'source.idl'
