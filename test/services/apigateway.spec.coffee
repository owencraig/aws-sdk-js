helpers = require('../helpers')
AWS = helpers.AWS

describe 'AWS.APIGateway', ->
  apigateway = null
  request = (operation, params) -> apigateway.makeRequest(operation, params)

  beforeEach ->
    apigateway = new AWS.APIGateway()

  describe 'building a request', ->
    build = (operation, params) ->
      request(operation, params).build().httpRequest

    describe 'sets Accept: application/json', ->
      it 'always sets accept header', ->
        req = build('getApiKey', apiKey: 'apiKey')
        expect(req.headers['Accept']).to.equal('application/json')
        req = build('createApiKey', {})
        expect(req.headers['Accept']).to.equal('application/json')
        req = build('updateApiKey', apiKey: 'apiKey')
        expect(req.headers['Accept']).to.equal('application/json')