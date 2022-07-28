<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dialer extends Model
{
    use HasFactory;

    protected $fillable = [
        'phone_number',
        'title',
        'first_name',
        'last_name',
        'middle_name',
        'address1',
        'address2',
        'address3',
        'city',
        'state',
        'province',
        'postal_code',
        'company',
        'email',
        'website',
        'position',
        'product_category',
    ];
}


