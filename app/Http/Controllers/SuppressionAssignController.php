<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SuppressionGroup;
use App\Http\Suppression\Fetch;

class SuppressionAssignController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index(Request $request)
    {
        $campaigns = collect(Fetch::get_campaign())->sortBy('name');
        $questions = $request->database ? collect(Fetch::get_questions($request->database))->sortBy('code'): [];
        $database = $request->database ?? null;
        $files = SuppressionGroup::get()->sortBy('file_name');

        return view('Suppression.Assign', compact('campaigns', 'questions', 'database', 'files'));
    }
}
