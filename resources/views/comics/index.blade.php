@extends('layouts.app')

@section('content')
    <section id="comics">
        <div class="container mt-5">
            {{-- Button for modal --}}
            <button type="button" class="btn btn-outline-primary my-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <i class="bi bi-plus-lg"></i>
            </button>

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

    <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Aggiungi fumetto</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-control"> 
            <form action="{{route('comics.store')}}" class="p-2" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="titolo" class="form-label">Titolo</label>
                    <input type="email" class="form-control" id="titolo" name="titolo" placeholder="name@example.com">
                </div>
                <div class="mb-3">
                    <label for="descrizione" class="form-label">Descrizione</label>
                    <textarea class="form-control" id="descrizione" name="descrizione" rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label for="prezzo" class="form-label">Prezzo</label>
                    <input type="text" class="form-control" id="prezzo" name="prezzo">
                </div>
                <div class="mb-3">
                    <label for="img" class="form-label">Immagine</label>
                    <input type="file" class="form-control" id="img" name="img">
                </div>
                <div class="mb-3">
                    <label for="release_date" class="form-label">Data di pubblicazione</label>
                    <input type="text" class="form-control" id="release_date" name="release_date">
                </div>
            </form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-outline-success">Salva</button>
      </div>
    </div>
  </div>
</div>
@endsection