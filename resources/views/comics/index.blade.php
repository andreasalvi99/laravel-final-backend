@extends('layouts.app')

@section('content')
    <section id="comics">
        <div class="container mt-5">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Titolo</th>
                        <th scope="col">Pubblicazione</th>
                        <th scope="col">Prezzo</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($comics as $comic)
                    <tr>
                        <th scope="row">{{$comic->id}}</th>
                        <td>{{$comic->title}}</td>
                        <td>{{$comic->release_date}}</td>
                        <td>{{$comic->price}} . &euro;</td>  
                    </tr>
                        @endforeach
                </tbody>
            </table>
        </div>
    </section>
@endsection