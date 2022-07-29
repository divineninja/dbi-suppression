<?php

namespace App\Http\Controllers;

use App\Models\Dialer;
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
            $data = Dialer::where('phone_number', $request->number)->first();
            
            return response()->json([
                'leads' => $data,
                'status' => 'ok',
                'code' => 200,
            ], 200)->withCallback('callback_function');
        } else {
            abort('404', 'You are not allowed to access this page');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\dialer  $dialer
     * @return \Illuminate\Http\Response
     */
    public function show(dialer $dialer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\dialer  $dialer
     * @return \Illuminate\Http\Response
     */
    public function edit(dialer $dialer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\dialer  $dialer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, dialer $dialer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\dialer  $dialer
     * @return \Illuminate\Http\Response
     */
    public function destroy(dialer $dialer)
    {
        //
    }
}
