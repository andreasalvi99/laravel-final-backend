@extends('layouts.app')

@section('content')
    <section id="comics">
        <div class="container mt-5">
            <div class="row row-cols-5">
                @foreach ($comics as $comic)
                    <div class="col">
                        <div class="card h-100">
                            <img src={{asset('storage/' . $comic->cover_img)}} class="card-img-top" alt="...">
                            <div class="card-body">
                                <p class="card-text">
                                    {{$comic->title}}
                                </p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
@endsection