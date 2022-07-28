<?php

namespace App\Http\Controllers;

use App\Models\QuestionSuppression;
use Illuminate\Http\Request;
use Carbon\Carbon;

class QuestionSuppressionController extends Controller
{
    private $params;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $this->params = collect(json_decode(base64_decode($request->data)));

        $this->validate_params();

        $phone = $this->params['phone'];

        $query = QuestionSuppression::where('campaign', $this->params['username'])
                                    ->where('question', $this->params['question'])
                                    ->with(['suppression'])
                                    ->whereHas('suppression', function ($query) use ($phone) {
                                        $query->where('phone', $phone);
                                    })
                                    ->firstOrFail();

        return response()->json([
            'status' => 'success',
            'message' => 'This question can be ask.',
            'code' => 200,
            'data' => $query,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $campaign = $request->campaign;
        // create array for insert
        $question = $request->question;
        $groups = collect($request->group);

        $group = $groups->map(function ($group) use ($campaign, $question) {
            return  [
                    'campaign' => $campaign,
                    'question' => $question,
                    'group' => $group,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                    ];
        });

        QuestionSuppression::insert($group->all());

        return redirect()->route('voyager.question-suppressions.index');
    }

    
    /**
     * validate_params
     *
     * @return void
     */
    private function validate_params()
    {
        if ($this->params->count() == 3) {
            return true;
        }
        abort('401', 'Not enough parameters');
    }
    
    /**
     * Testing method
     * create_url
     *
     * @return void
     */
    private function create_url()
    {
        $params = array(
            'username' => 'backup_14June2022_24kbullion',
            'phone' => '123',
            'question' => '28'
        );

        $encoded = base64_encode(json_encode($params));


        return 'https://dbi-suppression.test/suppression/get_suppression/'.$encoded;
    }
}
