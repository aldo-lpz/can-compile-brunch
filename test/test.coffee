Plugin = require('../')
should = require('chai').should()

describe 'Plugin', ->
	plugin = undefined

	beforeEach ->
		plugin = new Plugin 
			paths :
				root : '.'
			plugins :
				canCompile : {}

	it 'should be an object', ->
		plugin.should.be.an 'object'

	it 'should have a compile function', ->
		plugin.should.have.property 'compile'

	it 'should have an options property in the contructor', ->		
		plugin.should.have.property 'options'

	it 'options property should have version and basePath and preloadType', ->
		plugin.options.version.should.exist
		plugin.options.basePath.should.exist
		plugin.options.preloadType.should.exist

	it 'should generate the expected result', (done) ->
		this.timeout 5000
		
		expected = "module.exports = can.view.preloadStringRenderer(\"test_tmpl_mustache\", can.Mustache(function(scope,options) { var ___v1ew = [];___v1ew.push(\n\"<div>\");___v1ew.push(\ncan.view.txt(\n1,\n'div',\n0,\nthis,\ncan.Mustache.txt(\n{scope:scope,options:options},\nnull,{get:\"testing\"})));___v1ew.push(\n\"</div>\");; return ___v1ew.join('') }));"

		plugin.compile null, "test/tmpl.mustache", (error, data) ->
			should.equal error, null
			data.should.be.equal expected
			done()












