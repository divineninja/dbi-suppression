<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuppressionGroup extends Model
{
    use HasFactory;

    protected $fillable = ['file_name','location','count'];
}
