<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\DialersImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Dialer;

/**
 * ImportController
 */
class ImportController extends Controller
{
    /**
     * form
     *
     * @return void
     */
    public function form()
    {
        return view('Dialer.Import');
    }


    /**
     * submit
     *
     * @return void
     */
    public function submit(Request $request)
    {
        Excel::import(new DialersImport($request->file('file')->getClientOriginalName()), $request->file('file'));

        return redirect()->route('voyager.dialers.index');
    }


    /**
     * truncate
     *
     * @param  mixed $request
     * @return void
     */
    public function truncate(Request $request)
    {
        Dialer::truncate();
        return redirect()->route('voyager.dialers.index');
    }
}
