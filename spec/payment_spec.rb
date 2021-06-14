describe 'criacao de transacao com boleto' do

  it 'Cenario 1: Todos os dados validos - Valida HTTP status code' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(201)     
  end

  it 'Cenario 1: Todos os dados validos - Valida dados do cliente são iguais ao enviado' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response['data_response']['transaction']['customer']['name']).to eq('João Pedro')
            expect(@response['data_response']['transaction']['customer']['cpf']).to eq('73197009053')
  end

  it 'Cenario 1: Todos os dados validos - Valida valor informado é o mesmo enviado' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response['data_response']['transaction']['payment']['price_payment']).to eq('142.0')
            expect(@response['data_response']['transaction']['payment']['price_original']).to eq('142.0')
  end

  it 'Cenario 1: Todos os dados validos - Valida retorno da url do boleto,linha digitavel e tid' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response['data_response']['transaction']['payment']['linha_digitavel']).to eq('123123123123123131232131232131313211231321321')
            expect(@response['data_response']['transaction']['payment']['url_payment']).to include('https://intermediador-sandbox.yapay.com.br/orders/billet/')
  end

  it 'Cenario 2: Email invalido -' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"pedroinvalido"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['validation_errors'][0]['code']).to eql ("3")
            expect(@response['error_response']['validation_errors'][0]['message']).to eq("não é válido")
            expect(@response['error_response']['validation_errors'][0]['field']).to eq("email")
            expect(@response['error_response']['validation_errors'][0]['message_complete']).to eq("E-mail não é válido")
  end

  it 'Cenario 3: CPF invalido' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"11113333333",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['validation_errors'][0]['code']).to eql ("3")
            expect(@response['error_response']['validation_errors'][0]['message']).to eq("não é válido")
            expect(@response['error_response']['validation_errors'][0]['field']).to eq("cpf")
            expect(@response['error_response']['validation_errors'][0]['message_complete']).to eq("CPF não é válido")
  end

  it 'Cenario 4: Valor do produto igual a 0' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"0",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":" ",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['validation_errors'][0]['code']).to eql ("17")
            expect(@response['error_response']['validation_errors'][0]['message']).to eq("deve ser maior do que 0")
            expect(@response['error_response']['validation_errors'][0]['field']).to eq("price_seller")
            expect(@response['error_response']['validation_errors'][0]['message_complete']).to eq("Valor loja deve ser maior do que 0")
  end

  it 'Cenario 5: Valor do produto negativo' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"-5",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":" ",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"6"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['validation_errors'][0]['code']).to eql ("17")
            expect(@response['error_response']['validation_errors'][0]['message']).to eq("deve ser maior do que 0")
            expect(@response['error_response']['validation_errors'][0]['field']).to eq("price_seller")
            expect(@response['error_response']['validation_errors'][0]['message_complete']).to eq("Valor loja deve ser maior do que 0")
  end

  it 'Cenario 6: ID da forma de pagamento invalida ' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
              "payment":{  
                "payment_method_id":"99"
              }
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['general_errors'][0]['code']).to eql ("003010")
            expect(@response['error_response']['general_errors'][0]['message']).to eq("Forma de pagamento inválida")
    end 

  it 'Cenario 7:Dados sem o nó de pagamento -' do
    @new_payment = {  
              "token_account":"3f35bb4dc40f28b",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"H",
                    "number_contact":"1133221122"
                  },
                  {  
                    "type_contact":"M",
                    "number_contact":"11999999999"
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"B",
                    "postal_code":"17000-000",
                    "street":"Av Esmeralda",
                    "number":"1001",
                    "completion":"A",
                    "neighborhood":"Jd Esmeralda",
                    "city":"Marilia",
                    "state":"SP"
                  }
                ],
                "name":"João Pedro",
                "birth_date":"27/06/1999",
                "cpf":"73197009053",
                "email":"joao@pedrinho.com"
              },
              "transaction_product":[  
                {  
                  "description":"Camiseta Tony Stark",
                  "quantity":"1",
                  "price_unit":"130.00",
                  "code":"1",
                  "sku_code":"0001",
                  "extra":"Informação Extra"
                }
              ],
              "transaction":{  
                "available_payment_methods":"2,3,4,5,6,7,14,15,16,18,19,21,22,23",
                "customer_ip":"127.0.0.1",
                "shipping_type":"Sedex",
                "shipping_price":"12",
                "price_discount":"",
                "url_notification":"http://www.loja.com.br/notificacao",
                "free":"Campo Livre"
              },
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['general_errors'][0]['code']).to eql ("003010")
            expect(@response['error_response']['general_errors'][0]['message']).to eq("Forma de pagamento inválida")
    end 

  it 'Cenario 8: Todos os dados em branco' do
    @new_payment = {  
              "token_account":"",
              "customer":{  
                "contacts":[  
                  {  
                    "type_contact":"",
                    "number_contact":""
                  },
                  {  
                    "type_contact":"",
                    "number_contact":""
                  }
                ],
                "addresses":[  
                  {  
                    "type_address":"",
                    "postal_code":"",
                    "street":"",
                    "number":"",
                    "completion":"",
                    "neighborhood":"",
                    "city":"",
                    "state":""
                  }
                ],
                "name":"",
                "birth_date":"",
                "cpf":"",
                "email":""
              },
              "transaction_product":[  
                {  
                  "description":"",
                  "quantity":"",
                  "price_unit":"",
                  "code":"",
                  "sku_code":"",
                  "extra":""
                }
              ],
              "transaction":{  
                "available_payment_methods":"",
                "customer_ip":"",
                "shipping_type":"",
                "shipping_price":"",
                "price_discount":"",
                "url_notification":"",
                "free":""
              },
            }

            @response = Payment.post('/api/v3/transactions/payment', :body => @new_payment)
            expect(@response.code).to eq(422)
            expect(@response['message_response']['message']).to eq('error')
            expect(@response['error_response']['general_errors'][0]['code']).to eql ("003039")
            expect(@response['error_response']['general_errors'][0]['message']).to eq("Vendedor inválido ou não encontrado")
  end 
end