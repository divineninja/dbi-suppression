<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuestionSuppression extends Model
{
    use HasFactory;

    protected $fillable = ['campaign','question','group'];


    /**
     * UploadGroup
     *
     * @return void
     */
    public function UploadGroup()
    {
        return $this->belongsTo(SuppressionGroup::class, 'group');
    }

    public function suppression()
    {
        return $this->belongsTo(Suppression::class,'group');
    }
}
