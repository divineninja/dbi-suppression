<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Crm\ManilaConnection;

class BacolodToManilaController extends Controller
{
    public function index()
    {
        $connection = new ManilaConnection('222.127.15.164', 'laravelapi', '@ut0g3n3r@tedP@$$w0rd', 'crmapi');

        $connection->connect();

        $campaigns = $connection->getCampaigns();

        return view('CRM.Bcd2Mnl', compact('campaigns'));
    }
}
