<?php

namespace App\Http\Suppression;

use App\Models\Dialer;

class Fetch
{

    /**
    * get_campaign
    *
    * @return json
    */
    public static function get_campaign()
    {
        $ip = setting('admin.crm') ?? config('app.crm');
        $url = "http://$ip/api.php";

        return self::get_data_guzzle($url);
    }

    /**
     * get_questions
     *
     * @param  mixed $database
     * @return void
     */
    public static function get_questions($database)
    {
        $ip = setting('admin.crm') ?? config('app.crm');
        $url = "http://{$ip}/questions_api.php?username=".base64_encode($database);
        return self::get_data_guzzle($url);
    }
    
    /**
     * get_data_guzzle
     *
     * @param  mixed $url
     * @return void
     */
    public static function get_data_guzzle($url)
    {
        $user = config('app.auth_user');

        $pass = config('app.auth_pass');

        $client = new \GuzzleHttp\Client();

        $response = $client->request(
            'GET', /*instead of POST, you can use GET, PUT, DELETE, etc*/
            $url,
            [
              'auth' => [$user, $pass] /*if you don't need to use a password, just leave it null*/
            ]
        );
        
        return json_decode($response->getBody());
    }
}
