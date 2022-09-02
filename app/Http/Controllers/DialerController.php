<?php

namespace App\Http\Controllers;

use App\Models\Dialer;
use App\Models\DialerView;
use Illuminate\Http\Request;

class DialerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->number) {
            $data = DialerView::where('phone_number', $request->number)->first();

            return response()->json([
                'leads' => ($data) ? $data : false,
                'status' => 'ok',
                'code' => 200,
            ], 200)->withCallback('callback_function');
        } else {
            abort('404', 'You are not allowed to access this page');
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index_liveTable(Request $request)
    {
        if ($request->number) {
            $data = Dialer::where('phone_number', $request->number)->first();

            return response()->json([
                'leads' => ($data) ? $data : false,
                'status' => 'ok',
                'code' => 200,
            ], 200)->withCallback('callback_function');
        } else {
            abort('404', 'You are not allowed to access this page');
        }
    }
}
