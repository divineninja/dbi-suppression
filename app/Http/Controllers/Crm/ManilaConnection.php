<?php

namespace App\Http\Controllers\Crm;

use App\Http\Controllers\Crm\DatabaseConnectionController;
use DB;

class ManilaConnection extends DatabaseConnectionController
{

     /**
     * __construct
     *
     * @param  mixed $host
     * @param  mixed $username
     * @param  mixed $password
     * @param  mixed $databasename
     * @return void
     */
    public function __construct(String $host, String $username, String $password, String $databasename)
    {

        parent::__construct($host, $username, $password, $databasename);

        return $this;
    }

    public function getCampaigns()
    {
        $query = 'SELECT * FROM `campaign` ORDER BY `date_created` DESC';

        return DB::connection('crm')->select($query)->get();
    }
}
