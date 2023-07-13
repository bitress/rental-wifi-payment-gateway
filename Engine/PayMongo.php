<?php

use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;

class PayMongo
{

    /**
     * @var Client
     */
    private $client;
    /**
     * @var User
     */
    private $user;
    /**
     * @var mixed|null
     */
    private $loggedInUser;

    public function __construct(){
        $this->client = new GuzzleHttp\Client();
        $this->user = new User();
        $this->loggedInUser = Session::getSession('user_id');
    }

    /**

     * @throws GuzzleException
     */
    public function makeCheckout($price_amount, $quantity, $voucher_name)
    {

        $reference_number = 'REF' . time();

        $data = [
            'data' => [
                'attributes' => [
                    'billing' => [
                        'name' => 'Cyanne Justin Vega',
                        'email' => 'cyannejustinvega@pm.me',
                        'phone' => '09568104939'
                    ],
                    'line_items' => [
                        [
                            'currency' => 'PHP',
                            'amount' => $price_amount,
                            'name' => $voucher_name,
                            'quantity' => $quantity
                        ]
                    ],
                    'payment_method_types' => [
                        'gcash', 'card', 'paymaya'
                    ],
                    'send_email_receipt' => true,
                    'show_description' => false,
                    'show_line_items' => true,
                    'reference_number' => $reference_number,
                    'success_url' => 'http://localhost/payment-gateway/success.php'
                ]
            ]
        ];

        $json_body = json_encode($data);


        $response = $this->client->request('POST', 'https://api.paymongo.com/v1/checkout_sessions', [
            'body' => $json_body,
            'headers' => [
                'Content-Type' => 'application/json',
                'accept' => 'application/json',
                'authorization' => 'Basic c2tfdGVzdF93aUNjMVNacEt3TG5KeXhGYkZaWkZtTHQ6',
            ],
        ]);

        $json_response = $response->getBody();

        $data = json_decode($json_response, true);

        $checkoutId = $data['data']['id'];
        $checkoutType = $data['data']['type'];
        $checkoutUrl = $data['data']['attributes']['checkout_url'];
        $referenceNumber = $data['data']['attributes']['reference_number'];
        $paymentIntent = $data['data']['attributes']['payment_intent']['id'];


        Session::setSession('checkout_session_id', $checkoutId);


        echo "Checkout ID: $checkoutId <br>";
        echo "Checkout Type: $checkoutType <br>";
        echo "Checkout URL: <a href='$checkoutUrl'>Procceed to Checkout</a> <br>";
        echo "Reference Number: $referenceNumber <br>";
        echo "Payment Intent: $paymentIntent <br>";

    }

    /**
     * @throws GuzzleException
     */
    public function retrieveCheckout($checkout_session_id) {

        $uri = 'https://api.paymongo.com/v1/checkout_sessions/' .urlencode($checkout_session_id);

        $response = $this->client->request('GET', $uri, [
            'headers' => [
                'accept' => 'application/json',
                'authorization' => 'Basic c2tfdGVzdF93aUNjMVNacEt3TG5KeXhGYkZaWkZtTHQ6',
            ],
        ]);

        echo $response->getBody();
    }

}