@extends('voyager::master')

@section('page_title', 'Suppression | Upload')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-download"></i> Attach suppression to Campaign-Questions
        </h1>
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        <div class="panel panel-bordered">
            <form method="POST" action="{{ route('voyager.suppression.assign') }}">
                @csrf
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <h4>Campaign</h4>
                            <select name="campaign" id="Campaign" style="width: 100%">
                                <option value="">-- SELECT CAMPAIGN --</option>
                                @foreach ($campaigns as $key => $campaign)
                                    <option value="{{ $campaign->database }}"
                                        {{ $database == $campaign->database ? 'selected' : '' }}>
                                        {{ $campaign->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-4">
                            <h4>Question</h4>
                            <select name="question" id="Question" style="width: 100%;">
                                <option value="">-- SELECT QUESTIONS --</option>
                                @if ($questions)
                                    @foreach ($questions as $key => $question)
                                        <option value="{{ $question->id }}">{{ $question->code }} -
                                            {{ $question->question }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>
                        <div class="col-lg-4">
                            <h4>Files</h4>
                            <select name="group[]" multiple id="Campaign" style="height: 300px; width: 100%;">
                                @if ($files)
                                    @foreach ($files as $key => $file)
                                        <option value="{{ $file->id }}">{{ $file->file_name }} ({{ $file->count }})
                                            - {{ $file->created_at }}
                                        </option>
                                    @endforeach
                                @endif
                            </select>
                        </div>

                        <div class="col-lg-9"></div>
                        <div class="col-lg-3 text-right">
                            <button type="submit">Attach</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@stop


@section('css')
    <style>
        h4 {
            font-weight: bold;
            padding-bottom: 10px;
            text-align: left;
        }

        select,
        input,
        textarea {
            padding: 10px;
            width: 80%;
            height: 50px;
            border: 1px solid #dedede;
        }

        button {
            padding: 10px;
            width: 100%;
            background-color: #2fb0b4;
            border: 1px solid #3ee2e8;
            color: #e0feff;
            border-radius: 3px;
            font-size: 16px;
        }
    </style>
@stop


@section('javascript')
    <script>
        jQuery(document).ready(function($) {
            // add click event
            $('#Campaign').change(function() {
                window.location = "{{ route('voyager.suppression.assign.index') }}/" + $(this).val();
            })

        })
    </script>
@stop
