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

    it 'tokenizes inline comments', ->
        tokens = grammar.tokenizeLines 'foo = bar ; comment'

        expect(tokens[0][0].value).toBe 'foo = bar '
        expect(tokens[0][1].value).toBe ';'
        expect(tokens[0][1].scopes).toEqual ['source.idl', 'comment.line.semicolon.idl', 'punctuation.definition.comment.idl']
        expect(tokens[0][2].value).toBe ' comment'
        expect(tokens[0][2].scopes).toEqual ['source.idl', 'comment.line.semicolon.idl']

    it 'tokenizes leading comments', ->
        tokens = grammar.tokenizeLines ';\n; this is a comment\n;\n'

        expect(tokens[0][0].value).toBe ';'
        expect(tokens[0][0].scopes).toEqual ['source.idl', 'comment.line.semicolon.idl', 'punctuation.definition.comment.idl']
        expect(tokens[1][0].value).toBe ';'
        expect(tokens[1][0].scopes).toEqual ['source.idl', 'comment.line.semicolon.idl', 'punctuation.definition.comment.idl']
        expect(tokens[2][0].value).toBe ';'
        expect(tokens[2][0].scopes).toEqual ['source.idl', 'comment.line.semicolon.idl', 'punctuation.definition.comment.idl']

    it 'tokenizes command labels', ->
        tokens = grammar.tokenizeLines 'fail:'

        expect(tokens[0][0].value).toBe 'fail'
        expect(tokens[0][0].scopes).toEqual ['source.idl', 'entity.name.tag.idl']
        expect(tokens[0][1].value).toBe ':'
        expect(tokens[0][1].scopes).toEqual ['source.idl']

    it 'tokenizes keyword switches', ->
        tokens = grammar.tokenizeLines 'foo = bar(a,b,c,d,/baz)'

        expect(tokens[0][0].value).toBe 'foo = bar(a,b,c,d'
        expect(tokens[0][0].scopes).toEqual ['source.idl']
        expect(tokens[0][1].value).toBe ','
        expect(tokens[0][1].scopes).toEqual ['source.idl', 'punctuation.separator.parameters.idl']
        expect(tokens[0][2].value).toBe '/'
        expect(tokens[0][2].scopes).toEqual ['source.idl', 'keyword.operator.assignment.idl']
        expect(tokens[0][3].value).toBe 'baz'
        expect(tokens[0][3].scopes).toEqual ['source.idl', 'variable.parameter.function.idl']
        expect(tokens[0][4].value).toBe ')'
        expect(tokens[0][4].scopes).toEqual ['source.idl']

    it 'tokenizes keyword switches on multiple lines', ->
        tokens = grammar.tokenizeLines 'foo = bar(a,b,c,d, $\n          /baz)'

        expect(tokens[0][0].value).toBe 'foo = bar(a,b,c,d, $'
        expect(tokens[1][0].value).toBe '          '
        expect(tokens[1][1].value).toBe '/'
        expect(tokens[1][1].scopes).toEqual ['source.idl', 'keyword.operator.assignment.idl']
        expect(tokens[1][2].value).toBe 'baz'
        expect(tokens[1][2].scopes).toEqual ['source.idl', 'variable.parameter.function.idl']
        expect(tokens[1][3].value).toBe ')'
