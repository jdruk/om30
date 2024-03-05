# frozen_string_literal: true

require 'test_helper'

class MunicipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @municipe = municipes(:municipe_one)
  end

  test 'should get index' do
    get municipes_url
    assert_response :success
  end

  test 'should get new' do
    get new_municipe_url
    assert_response :success
  end

  test 'should create municipe' do
    assert_difference('Municipe.count') do
      address = @municipe.address
      file = fixture_file_upload("#{Rails.root}/test/fixtures/files/file.png")

      municipe_attributes = { birthdate: @municipe.birthdate, 
                            cns: @municipe.cns, 
                            cpf: @municipe.cpf, 
                            email: @municipe.email,
                            name: @municipe.name, 
                            phone: @municipe.phone, 
                            photo: file, 
                            status: @municipe.status, 
                            address_attributes: {
                              zip_code: address.zip_code, 
                              public_place: address.public_place, 
                              complement: address.complement, 
                              city: address.city, 
                              uf: address.uf,
                              ibge: address.ibge
                            }
                          }

      post municipes_url,
           params: { municipe: municipe_attributes }
    end

    assert_redirected_to municipe_url(Municipe.last)
  end

  test 'should show municipe' do
    get municipe_url(@municipe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_municipe_url(@municipe)
    assert_response :success
  end

  test 'should update municipe' do
    address = @municipe.address
    file = fixture_file_upload("#{Rails.root}/test/fixtures/files/file.png")

    municipe_attributes = { birthdate: @municipe.birthdate, 
                            cns: @municipe.cns, 
                            cpf: @municipe.cpf, 
                            email: @municipe.email,
                            name: @municipe.name, 
                            phone: @municipe.phone, 
                            photo: file, 
                            status: @municipe.status, 
                            address_attributes: {
                              zip_code: address.zip_code, 
                              public_place: address.public_place, 
                              complement: address.complement, 
                              city: address.city, 
                              uf: address.uf
                            }
                          }

    patch municipe_url(@municipe),
          params: { municipe:  municipe_attributes}
    assert_redirected_to municipe_url(@municipe)
  end

end
