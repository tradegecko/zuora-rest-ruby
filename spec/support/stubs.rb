def stub_zuora_call(end_point:, account: "1234")
  if end_point == "account_summary"
    stub_zuora_request(action: :get, end_point: "accounts/1234/summary", body: zuora_account_summary_response)
  elsif end_point == 'subscriptions'
    stub_zuora_request(action: :get, end_point: "subscriptions/accounts/1234", body: zuora_subscriptions_response)
  end
end

def stub_zuora_request(action:, end_point:, status: 200, response_body: {}, headers: {'Accept'=>'application/json', 'Content-Type'=>'application/json'}, exclude_version: false)
   stub_request(action, "https://apisandbox-api.zuora.com/rest/#{ exclude_version ? "" : "v1/" }#{ end_point }").
      with(:headers => headers).
      to_return(:status => status, :body => response_body)
end

def zuora_account_summary_response
  %Q{
    {
   "basicInfo":{
      "id":"2c92a0ff54eb82750154f3359b6a4ea4",
      "name":"Freedom Builders of America",
      "accountNumber":"A00001624",
      "balance":0E-9,
      "lastInvoiceDate":"2018-03-27",
      "lastPaymentDate":"2018-03-28",
      "lastPaymentAmount":259.000000000,
      "currency":"USD",
      "status":"Active",
      "batch":"Batch1",
      "billCycleDay":27,
      "invoiceDeliveryPrefsPrint":true,
      "invoiceDeliveryPrefsEmail":false,
      "additionalEmailAddresses":[
         ""
      ],
      "defaultPaymentMethod":{
         "id":"2c92a0fe5ea2f1de015eca1c48f72fbf",
         "paymentMethodType":"CreditCard",
         "creditCardNumber":"************3708",
         "creditCardExpirationMonth":4,
         "creditCardExpirationYear":2021,
         "creditCardType":"Visa"
      }
   },
   "billToContact":{
      "id":"2c92a0ff54eb82750154f3359b724ea5",
      "firstName":"Skip",
      "lastName":"Brown",
      "address1":null,
      "address2":null,
      "city":null,
      "county":null,
      "state":"MI",
      "zipCode":null,
      "country":null,
      "workEmail":"skip@fbmissions.org",
      "workPhone":"2319414171",
      "taxRegion":null,
      "fax":null
   },
   "soldToContact":{
      "id":"2c92a0ff54eb82750154f3359b794ea6",
      "firstName":"Skip",
      "lastName":"Brown",
      "address1":null,
      "address2":null,
      "city":null,
      "county":null,
      "state":"MI",
      "zipCode":null,
      "country":null,
      "workEmail":"skip@fbmissions.org",
      "workPhone":"2319414171",
      "taxRegion":null,
      "fax":null
   },
   "subscriptions":[
      {
         "id":"2c92a09a5c3e2232015c491f71771e83",
         "subscriptionNumber":"Freedom Builders of America- NFG DMS All-In-One",
         "ratePlans":[
            {
               "productId":"2c92a0fd528ddefe0152948d62122d91",
               "productName":"Donor Management",
               "productSku":"SKU-00000037",
               "productRatePlanId":"2c92a0fd528ddefe0152948d627b2da4",
               "ratePlanName":"NFG DMS - Monthly"
            },
            {
               "productId":"2c92a0fb4f7356aa014f751d3dff5312",
               "productName":"Everyday Giving Page",
               "productSku":"SKU-00000020",
               "productRatePlanId":"2c92a0f94f734497014f86762d804d6d",
               "ratePlanName":"Everyday Giving - Monthly"
            },
            {
               "productId":"2c92a0fb4f7356aa014f751d3db65307",
               "productName":"Peer-to-Peer Basic",
               "productSku":"SKU-00000015",
               "productRatePlanId":"2c92a0f84f7344cf014f86751b155d98",
               "ratePlanName":"Basic P2P - Monthly"
            },
            {
               "productId":"2c92a0fb501f2f57015023463b1c65b5",
               "productName":"Event Ticketing",
               "productSku":"SKU-00000035",
               "productRatePlanId":"2c92a0f9501f22540150234725402289",
               "ratePlanName":"Event Ticketing - Monthly"
            },
            {
               "productId":"2c92a0fb4f7356aa014f8555fc393c70",
               "productName":"Discount",
               "productSku":"SKU-00000028",
               "productRatePlanId":"2c92a0f950a7a0cf0150c0bf7765471c",
               "ratePlanName":"All-In-One Bundle Discount - All Tiers - Monthly"
            },
            {
               "productId":"2c92a0fb4f7356aa014f8555fc393c70",
               "productName":"Discount",
               "productSku":"SKU-00000028",
               "productRatePlanId":"2c92a0fb4f8d908f014f943238f5675f",
               "ratePlanName":"$20 off/month - Monthly"
            }
         ],
         "subscriptionStartDate":"2016-05-27",
         "initialTerm":12,
         "autoRenew":true,
         "renewalTerm":12,
         "termStartDate":"2017-05-27",
         "termEndDate":"2018-05-27",
         "status":"Active",
         "termType":"TERMED",
         "Service_Pack__c":null,
         "QuoteNumber__QT":null,
         "QuoteBusinessType__QT":null,
         "OpportunityCloseDate__QT":null,
         "OpportunityName__QT":null,
         "ProvisioningDate__c":null,
         "Discount_Reason__c":null,
         "CpqBundleJsonId__QT":null,
         "QuoteType__QT":null
      }
   ],
   "invoices":[
      {
         "id":"2c92a0b1626545b501626a557798661a",
         "invoiceNumber":"INV00055816",
         "invoiceDate":"2018-03-27",
         "dueDate":"2018-03-27",
         "amount":259.000000000,
         "balance":259.000000000,
         "status":"Posted"
      },
      {
         "id":"2c92a0a661c6a44b0161da5a525c0a8e",
         "invoiceNumber":"INV00052972",
         "invoiceDate":"2018-02-27",
         "dueDate":"2018-02-27",
         "amount":259.000000000,
         "balance":130.000000000,
         "status":"Posted"
      },
      {
         "id":"2c92a0b1610e689e01613ab5342939ed",
         "invoiceNumber":"INV00050027",
         "invoiceDate":"2018-01-27",
         "dueDate":"2018-01-27",
         "amount":259.000000000,
         "balance":0E-9,
         "status":"Posted"
      },
      {
         "id":"2c92a09a607ce0ac01609b1007c31d19",
         "invoiceNumber":"INV00046982",
         "invoiceDate":"2017-12-27",
         "dueDate":"2017-12-27",
         "amount":259.000000000,
         "balance":0E-9,
         "status":"Posted"
      },
      {
         "id":"2c92a09a5fe25e490160009143a07bf2",
         "invoiceNumber":"INV00043956",
         "invoiceDate":"2017-11-27",
         "dueDate":"2017-11-27",
         "amount":259.000000000,
         "balance":0E-9,
         "status":"Posted"
      },
      {
         "id":"2c92a0aa5f5c7237015f60b531602b27",
         "invoiceNumber":"INV00041351",
         "invoiceDate":"2017-10-27",
         "dueDate":"2017-10-27",
         "amount":259.000000000,
         "balance":0E-9,
         "status":"Posted"
      }
   ],
   "payments":[
      {
         "id":"2c92a0a6626551eb01626f0ee9980f02",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00054454",
         "effectiveDate":"2018-03-28",
         "paidInvoices":[
            {
               "invoiceId":"2c92a0b1626545b501626a557798661a",
               "invoiceNumber":"INV00055816",
               "appliedPaymentAmount":259.000000000
            }
         ]
      },
      {
         "id":"2c92a0b161c679300161df13d36372f6",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00051687",
         "effectiveDate":"2018-02-28",
         "paidInvoices":[
            {
               "invoiceId":"2c92a0a661c6a44b0161da5a525c0a8e",
               "invoiceNumber":"INV00052972",
               "appliedPaymentAmount":259.000000000
            }
         ]
      },
      {
         "id":"2c92a09a614173fa01614495950e52df",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00048782",
         "effectiveDate":"2018-01-29",
         "paidInvoices":[
            {
               "invoiceId":"2c92a0b1610e689e01613ab5342939ed",
               "invoiceNumber":"INV00050027",
               "appliedPaymentAmount":259.000000000
            }
         ]
      },
      {
         "id":"2c92a0b3607cec4e01609fc95e7052b9",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00045769",
         "effectiveDate":"2017-12-28",
         "paidInvoices":[
            {
               "invoiceId":"2c92a09a607ce0ac01609b1007c31d19",
               "invoiceNumber":"INV00046982",
               "appliedPaymentAmount":259.000000000
            }
         ]
      },
      {
         "id":"2c92a0b35fe268e70160054a6ac043db",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00042668",
         "effectiveDate":"2017-11-28",
         "paidInvoices":[
            {
               "invoiceId":"2c92a09a5fe25e490160009143a07bf2",
               "invoiceNumber":"INV00043956",
               "appliedPaymentAmount":259.000000000
            }
         ]
      },
      {
         "id":"2c92a0b05f6c8103015f6fbdfbe803c9",
         "paymentType":"Electronic",
         "status":"Processed",
         "paymentNumber":"P-00040320",
         "effectiveDate":"2017-10-30",
         "paidInvoices":[
            {
               "invoiceId":"2c92a0aa5f5c7237015f60b531602b27",
               "invoiceNumber":"INV00041351",
               "appliedPaymentAmount":259.000000000
            }
         ]
      }
   ],
   "usage":[

   ],
   "success":true
}
  }
end

def zuora_subscriptions_response
   %Q{
     {
      "subscriptions":[
         {
            "id":"2c92a0fe61e7b5da0161fd53003c6382",
            "accountId":"2c92a0fc5d8298f5015d9a0ad8f46518",
            "accountNumber":"A00004568",
            "accountName":"HEARTS OF HOPE FOUNDATION INC",
            "invoiceOwnerAccountId":"2c92a0fc5d8298f5015d9a0ad8f46518",
            "invoiceOwnerAccountNumber":"A00004568",
            "invoiceOwnerAccountName":"HEARTS OF HOPE FOUNDATION INC",
            "subscriptionNumber":"Hearts of Hope Foundation",
            "termType":"TERMED",
            "invoiceSeparately":true,
            "contractEffectiveDate":"2017-07-31",
            "serviceActivationDate":"2017-07-31",
            "customerAcceptanceDate":"2017-07-31",
            "subscriptionStartDate":"2017-07-31",
            "termStartDate":"2017-07-31",
            "termEndDate":"2018-07-31",
            "initialTerm":12,
            "initialTermPeriodType":"Month",
            "currentTerm":12,
            "currentTermPeriodType":"Month",
            "autoRenew":#{ auto_renew },
            "renewalSetting":"RENEW_WITH_SPECIFIC_TERM",
            "renewalTerm":12,
            "renewalTermPeriodType":"Month",
            "contractedMrr":367.00,
            "totalContractedValue":4404.00,
            "notes":null,
            "status":"Cancelled",
            "Service_Pack__c":null,
            "QuoteNumber__QT":null,
            "QuoteBusinessType__QT":null,
            "OpportunityCloseDate__QT":null,
            "OpportunityName__QT":null,
            "ProvisioningDate__c":"2017-07-31",
            "Discount_Reason__c":"Prepay Incentive",
            "CpqBundleJsonId__QT":null,
            "QuoteType__QT":null,
            "ratePlans":[
               {
                  "id":"2c92a0fe61e7b5da0161fd5300556386",
                  "productId":"2c92a0fb4f7356aa014f751d3dff5312",
                  "productName":"Everyday Giving Page",
                  "productSku":"SKU-00000020",
                  "productRatePlanId":"2c92a0f94f734496014f751d41792b95",
                  "ratePlanName":"Everyday Giving - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd5300556387",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ad9716525",
                        "productRatePlanChargeId":"2c92a0fa4f7356a6014f751d4d21089f",
                        "number":"C-00024494",
                        "name":"Donation Page",
                        "type":"Recurring",
                        "model":"FlatFee",
                        "uom":null,
                        "version":1,
                        "pricingSummary":"USD948",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":948.000000000,
                        "tiers":null,
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":null,
                        "applyDiscountTo":null,
                        "discountLevel":null,
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":"Per_Billing_Period",
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":"IN_ADVANCE",
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":1.000000000,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"#{ effective_start_date }",
                        "effectiveEndDate":"#{ effective_end_date }",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Subscription_End",
                        "upToPeriodsType":null,
                        "upToPeriods":null,
                        "specificEndDate":null,
                        "mrr":79.000000000,
                        "dmrc":79.000000000,
                        "tcv":948.000000000,
                        "dtcv":948.000000000,
                        "description":""
                     }
                  ]
               },
               {
                  "id":"2c92a0fe61e7b5da0161fd53006d6398",
                  "productId":"2c92a0fd528ddefe0152948d62122d91",
                  "productName":"Donor Management",
                  "productSku":"SKU-00000037",
                  "productRatePlanId":"2c92a0fd528ddefe0152948d62292d93",
                  "ratePlanName":"NFG DMS - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd53006d6399",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ad9946537",
                        "productRatePlanChargeId":"2c92a0fd528ddefe0152948d62482d95",
                        "number":"C-00024495",
                        "name":"NFG DMS Annual Recurring Charge",
                        "type":"Recurring",
                        "model":"Volume",
                        "uom":"Record",
                        "version":1,
                        "pricingSummary":"Up to 1000 Record: USD1188 flat fee;  Up to 2500 Record: USD1788 flat fee;  Up to 5000 Record: USD2388 flat fee;  Up to 10000 Record: USD3588 flat fee;  Up to 15000 Record: USD4788 flat fee;  Up to 25000 Record: USD5988 flat fee;  Up to 50000 Record: USD7188 flat fee;  Up to 75000 Record: USD8388 flat fee;  Up to 100000 Record: USD9588 flat fee;  Up to 125000 Record: USD10788 flat fee;  Up to 150000 Record: USD11988 flat fee;  Up to 200000 Record: USD13188 flat fee;  Up to 250000 Record: USD14388 flat fee;  USD15588 flat fee for 250001 Record or more",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":null,
                        "tiers":[
                           {
                              "tier":1,
                              "startingUnit":0E-9,
                              "endingUnit":1000.000000000,
                              "price":1188.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":2,
                              "startingUnit":1001.000000000,
                              "endingUnit":2500.000000000,
                              "price":1788.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":3,
                              "startingUnit":2501.000000000,
                              "endingUnit":5000.000000000,
                              "price":2388.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":4,
                              "startingUnit":5001.000000000,
                              "endingUnit":10000.000000000,
                              "price":3588.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":5,
                              "startingUnit":10001.000000000,
                              "endingUnit":15000.000000000,
                              "price":4788.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":6,
                              "startingUnit":15001.000000000,
                              "endingUnit":25000.000000000,
                              "price":5988.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":7,
                              "startingUnit":25001.000000000,
                              "endingUnit":50000.000000000,
                              "price":7188.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":8,
                              "startingUnit":50001.000000000,
                              "endingUnit":75000.000000000,
                              "price":8388.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":9,
                              "startingUnit":75001.000000000,
                              "endingUnit":100000.000000000,
                              "price":9588.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":10,
                              "startingUnit":100001.000000000,
                              "endingUnit":125000.000000000,
                              "price":10788.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":11,
                              "startingUnit":125001.000000000,
                              "endingUnit":150000.000000000,
                              "price":11988.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":12,
                              "startingUnit":150001.000000000,
                              "endingUnit":200000.000000000,
                              "price":13188.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":13,
                              "startingUnit":200001.000000000,
                              "endingUnit":250000.000000000,
                              "price":14388.000000000,
                              "priceFormat":"FlatFee"
                           },
                           {
                              "tier":14,
                              "startingUnit":250001.000000000,
                              "endingUnit":null,
                              "price":15588.000000000,
                              "priceFormat":"FlatFee"
                           }
                        ],
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":null,
                        "applyDiscountTo":null,
                        "discountLevel":null,
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":"Per_Billing_Period",
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":"IN_ADVANCE",
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":4500.000000000,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"#{ dm_effective_start_date }",
                        "effectiveEndDate":"#{ dm_effective_end_date }",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Subscription_End",
                        "upToPeriodsType":null,
                        "upToPeriods":null,
                        "specificEndDate":null,
                        "mrr":199.000000000,
                        "dmrc":199.000000000,
                        "tcv":2388.000000000,
                        "dtcv":2388.000000000,
                        "description":""
                     }
                  ]
               },
               {
                  "id":"2c92a0fe61e7b5da0161fd530097639d",
                  "productId":"2c92a0fb4f7356aa014f751d3db65307",
                  "productName":"Peer-to-Peer Basic",
                  "productSku":"SKU-00000015",
                  "productRatePlanId":"2c92a0f94f734496014f751d3f9c2b6c",
                  "ratePlanName":"Basic P2P - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd530097639e",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ad9b8653c",
                        "productRatePlanChargeId":"2c92a0fa4f7356a6014f751d4970085d",
                        "number":"C-00024496",
                        "name":"Basic P2P - Annual",
                        "type":"Recurring",
                        "model":"FlatFee",
                        "uom":null,
                        "version":1,
                        "pricingSummary":"USD1068",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":1068.000000000,
                        "tiers":null,
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":null,
                        "applyDiscountTo":null,
                        "discountLevel":null,
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":"Per_Billing_Period",
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":"IN_ADVANCE",
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":1.000000000,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"#{ effective_start_date }",
                        "effectiveEndDate":"#{ effective_end_date }",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Subscription_End",
                        "upToPeriodsType":null,
                        "upToPeriods":null,
                        "specificEndDate":null,
                        "mrr":89.000000000,
                        "dmrc":89.000000000,
                        "tcv":1068.000000000,
                        "dtcv":1068.000000000,
                        "description":""
                     }
                  ]
               },
               {
                  "id":"2c92a0fe61e7b5da0161fd5300b063a2",
                  "productId":"2c92a0fb501f2f57015023463b1c65b5",
                  "productName":"Event Ticketing",
                  "productSku":"SKU-00000035",
                  "productRatePlanId":"2c92a0fa501f2f3f0150234827753744",
                  "ratePlanName":"Event Ticketing - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd5300b063a3",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ad9d66541",
                        "productRatePlanChargeId":"2c92a0fa501f2f3f0150234827883746",
                        "number":"C-00024497",
                        "name":"Event Ticketing - Annual",
                        "type":"Recurring",
                        "model":"FlatFee",
                        "uom":null,
                        "version":1,
                        "pricingSummary":"USD0",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":0E-9,
                        "tiers":null,
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":null,
                        "applyDiscountTo":null,
                        "discountLevel":null,
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":"Per_Billing_Period",
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":"IN_ADVANCE",
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":1.000000000,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"#{ effective_start_date }",
                        "effectiveEndDate":"#{ 1.week.ago.to_s(:nat)}",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Subscription_End",
                        "upToPeriodsType":null,
                        "upToPeriods":null,
                        "specificEndDate":null,
                        "mrr":0E-9,
                        "dmrc":0E-9,
                        "tcv":0E-9,
                        "dtcv":0E-9,
                        "description":""
                     }
                  ]
               },
               {
                  "id":"2c92a0fe61e7b5da0161fd5300ce63a7",
                  "productId":"2c92a0fb4f7356aa014f8555fc393c70",
                  "productName":"Discount",
                  "productSku":"SKU-00000028",
                  "productRatePlanId":"2c92a0fa50a7c6ea0150c0c0820709d0",
                  "ratePlanName":"All-In-One Bundle Discount - All Tiers - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd5300ce63a8",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ad9f66546",
                        "productRatePlanChargeId":"2c92a0fa50a7c6ea0150c0c0821709d3",
                        "number":"C-00024498",
                        "name":"Annual Bundle Discount",
                        "type":"Recurring",
                        "model":"DiscountFixedAmount",
                        "uom":null,
                        "version":1,
                        "pricingSummary":"USD1056 fixed amount discount",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":null,
                        "tiers":null,
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":1056.000000000,
                        "applyDiscountTo":"ONETIMERECURRINGUSAGE",
                        "discountLevel":"subscription",
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":null,
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":null,
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":null,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"2017-07-31",
                        "effectiveEndDate":"2018-07-31",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Subscription_End",
                        "upToPeriodsType":null,
                        "upToPeriods":null,
                        "specificEndDate":null,
                        "mrr":0E-9,
                        "dmrc":0E-9,
                        "tcv":0E-9,
                        "dtcv":0E-9,
                        "description":""
                     }
                  ]
               },
               {
                  "id":"2c92a0fe61e7b5da0161fd5300ea63ad",
                  "productId":"2c92a0fb4f7356aa014f8555fc393c70",
                  "productName":"Discount",
                  "productSku":"SKU-00000028",
                  "productRatePlanId":"2c92a0fe5a241e5a015a429543f71b78",
                  "ratePlanName":"Custom Discount per Year - Annual",
                  "ratePlanCharges":[
                     {
                        "id":"2c92a0fe61e7b5da0161fd5300ea63ae",
                        "originalChargeId":"2c92a0fc5d8298f5015d9a0ada16654b",
                        "productRatePlanChargeId":"2c92a0fe5a241e5a015a429544031b7b",
                        "number":"C-00024499",
                        "name":"Custom Annual Discount ",
                        "type":"Recurring",
                        "model":"DiscountFixedAmount",
                        "uom":null,
                        "version":1,
                        "pricingSummary":"USD600 fixed amount discount",
                        "priceChangeOption":null,
                        "priceIncreasePercentage":null,
                        "currency":"USD",
                        "price":null,
                        "tiers":null,
                        "includedUnits":null,
                        "overagePrice":null,
                        "discountPercentage":null,
                        "discountAmount":600.000000000,
                        "applyDiscountTo":"ONETIMERECURRINGUSAGE",
                        "discountLevel":"subscription",
                        "discountClass":null,
                        "discountApplyDetails":[

                        ],
                        "billingDay":"DefaultFromCustomer",
                        "listPriceBase":null,
                        "billingPeriod":"Annual",
                        "specificBillingPeriod":null,
                        "billingTiming":null,
                        "billingPeriodAlignment":"AlignToCharge",
                        "quantity":null,
                        "smoothingModel":null,
                        "numberOfPeriods":null,
                        "overageCalculationOption":null,
                        "overageUnusedUnitsCreditOption":null,
                        "unusedUnitsCreditRates":null,
                        "usageRecordRatingOption":null,
                        "segment":1,
                        "effectiveStartDate":"2017-07-31",
                        "effectiveEndDate":"2018-07-31",
                        "processedThroughDate":"2017-07-31",
                        "chargedThroughDate":"2018-07-31",
                        "done":false,
                        "triggerDate":null,
                        "triggerEvent":"ContractEffective",
                        "endDateCondition":"Fixed_Period",
                        "upToPeriodsType":"Billing_Periods",
                        "upToPeriods":2,
                        "specificEndDate":null,
                        "mrr":0E-9,
                        "dmrc":0E-9,
                        "tcv":0E-9,
                        "dtcv":0E-9,
                        "description":""
                     }
                  ]
               }
            ]
         }
      ],
      "success":true
   }
   }
end

def zuora_preview_billing_response_successful(account_id: "1234")
   {
      "results" => [
      {
         "AccountId" =>  account_id,
         "InvoiceItem" => [
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => 109,
               "Id" => "1d60fcdcda194d21942121b8a50f3716",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "RatePlanChargeId" => "2c92a0ff639634050163add08a7e035e",
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "Quantity" => 1,
               "ChargeNumber" => "C-00022054",
               "ProcessingType" => 0
            },
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => 79,
               "Id" => "66f7ac2f6d9d49989f8d6f12ed059121",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "RatePlanChargeId" => "2c92a0ff639634050163add08a880363",
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "Quantity" => 1,
               "ChargeNumber" => "C-00022055",
               "ProcessingType" => 0
            },
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => 0,
               "Id" => "0c316bc9be264396afdf16cbf2124ec3",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "RatePlanChargeId" => "2c92a0ff639634050163add08a920369",
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "Quantity" => 1,
               "ChargeNumber" => "C-00022056",
               "ProcessingType" => 0
            },
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => 30,
               "Id" => "bf2614d63b7948af9938bdb222a78e93",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "RatePlanChargeId" => "2c92a0ff639634050163add08a9c036e",
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "Quantity" => 1,
               "ChargeNumber" => "C-00022057",
               "ProcessingType" => 0
            },
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => -30,
               "Id" => "61a0c3bfc905403c976e9c7cd61a2375",
               "ChargeNumber" => "C-00022058",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "ProcessingType" => 1,
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "RatePlanChargeId" => "2c92a0ff639634050163add08aa90374",
               "Quantity" => 1,
               "AppliedToInvoiceItemId" => "1d60fcdcda194d21942121b8a50f3716",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00"
            },
            {
               "SubscriptionNumber" => "Community Robotics of Metro Detroit-JS P2P + EGP $158\\/m",
               "ChargeAmount" => -30,
               "Id" => "8eca8251f7874776b5ec404e2a5cf61b",
               "ChargeNumber" => "C-00037745",
               "ChargeType" => "Recurring",
               "SubscriptionId" => "2c92a0ff639634050163add08a610353",
               "ProcessingType" => 1,
               "ServiceStartDate" => "2018-05-31",
               "ServiceEndDate" => "2018-06-29",
               "RatePlanChargeId" => "2c92a0ff639634050163add08a720358",
               "Quantity" => 1,
               "AppliedToInvoiceItemId" => "1d60fcdcda194d21942121b8a50f3716",
               "ChargeDate" => "2018-05-30T07 => 35 => 57.097-07 => 00"
            }
         ],
         "Size" => 6,
         "Success" => true
      }
   ]
}
end

def zuora_preview_billing_response_failure(account_id: "1234")
   {"results" => [
      {
         "AccountId" => account_id,
         "Errors" => [
            {
               "Code" => "REQUEST_REJECTED",
               "Message" => "The account must be an active account."
            }
         ],
         "Success" => false
      }
   ]
   }
end

def auto_renew
  true
end

def effective_start_date
  1.year.ago.to_s(:nat)
end

def effective_end_date
  1.week.from_now.to_s(:nat)
end

def dm_effective_start_date
  effective_start_date
end

def dm_effective_end_date
  effective_end_date
end