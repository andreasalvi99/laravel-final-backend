@extends('layouts.app')

@section('content')
    <section id="comics">
        <div class="container mt-5">
            {{-- Button for modal create--}}
            <button type="button" class="btn btn-outline-primary my-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <i class="bi bi-plus-lg"></i>
            </button>

            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Titolo</th>
                        <th scope="col">Brand</th>
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
                                    <img src="{{asset('storage/' . $comic->brand->logo)}}" alt="" style="height: 30px">
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
                            <td class="d-flex gap-2">
                                <!-- Button trigger modal edit-->
                            <button type="button" class="btn btn-bd-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editbackdrop{{$comic->id}}">
                                <i class="bi bi-pencil-fill"></i>
                            </button>
                            <button type="button" class="btn btn-bd-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deletemodal{{$comic->id}}">
                                <i class="bi bi-trash3-fill"></i>
                            </button>
                            </td>  
                        </tr>

                        <!-- Modal edit-->
                            <div class="modal fade" id="editbackdrop{{$comic->id}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modifica fumetto</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-control">
                                        <form action="{{route('comics.update', $comic->id)}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label for="titolo" class="form-label">Titolo</label>
                                                <input type="text" class="form-control" id="titolo" name="title" value="{{$comic->title}}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="brand_id" class="form-label">Brand</label>
                                                <select type="text" class="form-control" id="brand_id" name="brand_id">
                                                    @foreach ($brands as $brand)
                                                        <option value="{{$comic->brand_id}}" {{$comic->brand_id == $brand->id ? "selected" : ""}}>{{$brand->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="descrizione" class="form-label">Descrizione</label>
                                                <textarea class="form-control" id="descrizione" name="description" rows="2">{{$comic->description}}</textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="prezzo" class="form-label">Prezzo</label>
                                                <input type="text" class="form-control" id="prezzo" name="price" value="{{$comic->price}}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="img" class="form-label">Immagine</label>
                                                <input type="file" class="form-control" id="img" name="cover_img">
                                                @if ($comic->cover_img)
                                                    <img src="{{asset('storage/' . $comic->cover_img)}}" alt="" class="w-50 h-50">
                                                @endif
                                            </div>
                                            <div class="mb-3">
                                                <label for="release_date" class="form-label">Data di pubblicazione</label>
                                                <input type="text" class="form-control" id="release_date" name="release_date" value="{{$comic->release_date}}">
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-outline-success">Salva</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                </div>
                            </div>
                            </div>

                            {{-- Modal delete --}}
                            <div class="modal fade" id="deletemodal{{$comic->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body fw-semibold fs-4">
                                    Sei sicuro di voler eliminare {{$comic->title}}?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Chiudi</button>
                                    <form action="{{route('comics.destroy', $comic->id)}}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-bd-secondary btn-sm" type="submit">
                                            Elimina
                                        </button>
                                    </form>
                                </div>
                                </div>
                            </div>
                            </div>
                        @endforeach
                </tbody>
            </table>
        </div>
    </section>

    <!-- Modal create-->
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
                    <input type="text" class="form-control" id="titolo" name="title">
                </div>
                <div class="mb-3">
                    <label for="brand_id" class="form-label">Brand</label>
                    <select type="text" class="form-control" id="brand_id" name="brand_id">
                        @foreach ($brands as $brand)
                            <option value="{{$brand->id}}">{{$brand->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-3">
                    <label for="descrizione" class="form-label">Descrizione</label>
                    <textarea class="form-control" id="descrizione" name="description" rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label for="prezzo" class="form-label">Prezzo</label>
                    <input type="text" class="form-control" id="prezzo" name="price">
                </div>
                <div class="mb-3">
                    <label for="img" class="form-label">Immagine</label>
                    <input type="file" class="form-control" id="img" name="cover_img">
                </div>
                <div class="mb-3">
                    <label for="release_date" class="form-label">Data di pubblicazione</label>
                    <input type="text" class="form-control" id="release_date" name="release_date">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-outline-success">Salva</button>
                </div>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection