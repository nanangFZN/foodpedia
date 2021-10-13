<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Xendit\Xendit;

class XenditController extends Controller
{
    
    public function index()
    {
       
        Xendit::setApiKey('xnd_development_P4qDfOss0OCpl8RtKrROHjaQYNCk9dN5lSfk+R1l9Wbe+rSiCwZ3jw==');

        $getVABanks = \Xendit\VirtualAccounts::getVABanks();
        return response()->json(['data'=>$getVABanks]);
    }
}
