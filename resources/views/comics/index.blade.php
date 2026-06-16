@extends('layouts.app')

@section('content')
    <section id="comics">
        <div class="container mt-5">
            <table class="table table-hover">
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
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->title}}
                                </a>
                                
                            </td>
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->release_date}}
                                </a>
                                
                            </td>
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    &euro;{{$comic->price}}
                                </a>
                                
                            </td>  
                        </tr>
                        @endforeach
                </tbody>
            </table>
        </div>
    </section>
@endsection