require 'test_helper'

class MunicipeUpdateOperationTest < ActiveSupport::TestCase
  def setup
    @operation = Operation::Municipe::Update
    @municipe = municipes(:municipe_one)
  end

  test 'should update municipe with valid attributes' do

    params = {
      model: @municipe,
      model_attributes: {
        birthdate: '1990-01-01',
        cns: '123456789012345',
        cpf: '88835267404',
        email: 'test@example.com',
        name: 'John Doe',
        phone: '123-456-7890',
        photo: '/test/fixtures/files/file.png',
        status: 'active',
        address_attributes: {
          zip_code: '12345-678',
          public_place: '123 Main St',
          complement: 'Apt 101',
          city: 'Cityville',
          uf: 'CA',
          ibge: '1234567'
        }
      }
    }

    result = @operation.call(params: params)

    assert result.success?
    assert_equal 201, result[:status_code]
    assert_not_nil result[:model]
  end

  test 'should handle validation errors' do
    params = {
      model_attributes: {
        birthdate: '1990-01-01',
        cns: '123456789012345',
        address_attributes: {
          zip_code: '12345-678'
        }
      }
    }

    result = @operation.call(params: params)

    assert result.failure?
    assert_equal 422, result[:status_code]
    assert_not_nil result[:errors]
  end
end
