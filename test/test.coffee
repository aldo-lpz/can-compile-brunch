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

	it 'options property should have version and basePath and moduleWrapper', ->
		plugin.options.version.should.exist
		plugin.options.basePath.should.exist
		plugin.options.moduleWrapper.should.exist











