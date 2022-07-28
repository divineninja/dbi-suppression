<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\SuppressionGroup;
use App\Models\QuestionSuppression;

/**
 * Suppression
 */
class Suppression extends Model
{
    use HasFactory;
    
    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = ['phone','group'];

    /**
     * UploadGroup
     *
     * @return void
     */
    public function UploadGroup()
    {
        return $this->belongsTo(SuppressionGroup::class, 'group');
    }

    public function QuestionSuppression()
    {
        return $this->belongsTo(QuestionSuppression::class, 'group', 'group');
    }
}
