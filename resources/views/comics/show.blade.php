@extends('layouts.app')

@section('content')
    <section id="comic">
        <div class="container mt-5">
            <div class="mb-3">
                <a href="{{route('comics.index')}}" class="text-dark">
                    <i class="bi bi-arrow-left me-2"></i>Torna  ai fumetti
                </a>
            </div>
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
                                <span class="text-body-secondary">
                                    {{\Carbon\Carbon::parse($comic->release_date)->translatedFormat('j')}}
                                    {{ucfirst(\Carbon\Carbon::parse($comic->release_date)->translatedFormat('F'))}},
                                    {{\Carbon\Carbon::parse($comic->release_date)->translatedFormat('Y')}}
                                </span>
                            </p>
                            <div>
                                <span>
                                    Featuring: 
                                    @foreach ($comic->characters as $character)
                                    <a href="{{route('characters.show', $character->id)}}" class="text-decoration-none text-dark">
                                        {{$character->name . ','}}
                                    </a>
                                        
                                    @endforeach
                                </span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <img src="{{asset('storage/' . $comic->brand->logo)}}" alt="" style="{{$comic->brand->name === "Marvel Comics" ? "height: 80px; width: 200px" : "height: 100px; width:100px"}}">
                                    <p class="align-self-end m-0 fs-1 fw-semibold">
                                        <i>
                                            &euro;{{$comic->price}}
                                        </i>
                                    </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    {{-- <section id="related-characters">
        <div class="container mt-5">
            <h1>Personaggi correlati:</h1>
            @foreach ($comic->characters as $character)
                <span class="badge rounded-pill text-bg-primary">{{$character->name}}</span>
            @endforeach
        </div>
    </section> --}}
@endsection