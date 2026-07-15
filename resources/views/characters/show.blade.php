@extends('layouts.app')

@section('content')
    <section>
        <div class="container mt-5">
            <div class="mb-3">
                <a href="{{route('characters.index')}}" class="text-dark">
                    <i class="bi bi-arrow-left me-2"></i>Torna  ai personaggi
                </a>
            </div>
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="{{asset('img/' . $character->character_img)}}" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body p-5 d-flex flex-column justify-content-around h-100">
                            <h5 class="card-title">{{$character->name}}</h5>
                            <p class="card-text">{{$character->description}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection