@extends('voyager::master')

@section('page_title', 'Suppression | Upload')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-download"></i> Suppression upload
        </h1>
    </div>
@stop

@section('content')
    <div class="page-content browse container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <form action="{{ route('voyager.suppression.upload.submit') }}" method="POST"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <input type="file" class="w-100 p-full" name="file" id="file"
                                                        required>
                                                </div>
                                                <div class="col-lg-4">
                                                    <input class="btn btn-primary w-100 p-full" type="submit"
                                                        value="Upload">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop


@section('css')
    <style>
        .w-100 {
            width: 100%;
        }

        .p-full {
            padding: 15px;
        }
    </style>
@stop
