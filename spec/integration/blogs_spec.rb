# spec/integration/blogs_spec.rb
require 'swagger_helper'

describe 'Blogs API' do

  path '/api/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      request_body_json schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          avatar: { type: :string }
        },
        required: [ 'first_name', 'last_name' ]
      }

      response '201', 'user created' do
        let(:user) { { first_name: 'Javier', last_name: 'Cuevas', email: 'javi@gmail.com', avatar: 'https://reqres.in/img/faces/1-image.jpg' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { first_name: 'Javier', last_name: 'Cuevas',  avatar: 'https://reqres.in/img/faces/1-image.jpg' } }
        run_test!
      end
    end
  end

  path '/api/users/{id}' do

    get 'Retrieves a user' do
      tags 'users'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string },
            avatar: { type: :string }
          },
          required: [ 'id', 'first_name', 'email' ]

        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/users' do

    get 'Get all the users' do
      tags 'users'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'users updated' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string },
            avatar: { type: :string }
          },
          required: [ 'id', 'first_name', 'email' ]

        run_test!
      end
    end
  end

  path '/api/users/{id}' do

    patch 'Update an user' do
      tags 'users'
      produces 'application/json', 'application/xml'

      response '200', 'users found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string },
            avatar: { type: :string }
          },
          required: [ 'id', 'first_name', 'email' ]

        run_test!
      end
    end
  end
end
