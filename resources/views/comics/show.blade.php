@extends('layouts.app')

@section('content')
    <section id="comic">
        <div class="container mt-5">
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="{{asset('storage/' . $comic->cover_img)}}" class="img-fluid rounded-start h-100 w-100" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body p-5 d-flex flex-column justify-content-between h-100">
                            <h5 class="card-title">{{$comic->title}}</h5>
                            <p class="card-text overflow-auto" style="min-height: 100px">
                                {{$comic->description}}
                            </p>
                            <p class="card-text">
                                Pubblicazione:
                                <small class="text-body-secondary">
                                    {{$comic->release_date}}
                                </small>
                            </p>
                            <img src="{{asset('storage/' . $comic->brand->logo)}}" alt="" style="{{$comic->brand->name === "Marvel Comics" ? "height: 80px; width: 200px" : "height: 100px; width:100px"}}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection