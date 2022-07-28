<?php

namespace App\Http\Controllers;

use App\Models\SuppressionGroup;
use App\Models\Suppression;
use Illuminate\Http\Request;
use App\Imports\SuppressionImport;
use Maatwebsite\Excel\Facades\Excel;

class SuppressionGroupController extends Controller
{
    private $group;
    private $file;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('Suppression.Upload');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->file = $request->file('file');
        $this->group = SuppressionGroup::create([
            'file_name' => $this->file->getClientOriginalName(), // get filename
            'count' => 1
        ]);

        Excel::import(new SuppressionImport($this->group->id), $this->file);
        $this->update_count();

        return redirect()->route('voyager.suppressions.index');
    }

    
    /**
     * update_count
     *
     * @return void
     */
    private function update_count()
    {
        $this->group->count = Suppression::where('group', $this->group->id)->count();
        $this->group->save();
    }
}
