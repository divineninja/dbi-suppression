@extends('voyager::master')

@section('page_title', 'Bacolod to Manila Migration')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-download"></i> Bacolod to Manila Migration
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
                                    @php
                                        print_r($campaigns);
                                    @endphp
                                </div>

                                <div class="col-lg-3">
                                    <a href="{{ route('voyager.dialer.truncate') }}"
                                        class="btn btn-danger w-100 p-full">Clear all Data</a>
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
