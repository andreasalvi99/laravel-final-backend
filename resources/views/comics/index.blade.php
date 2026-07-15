@extends('layouts.app')
<h1>TEST COMICS</h1>

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
                        <th scope="col">Latest</th>
                        <th scope="col">Preorder</th>
                        <th scope="col">Sconto</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($comics as $index => $comic)
                        <tr>
                            <th scope="row">{{$index + 1}}</th>
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->title}}
                                </a>
                            </td>
                             <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    <img src="{{asset('img/' . $comic->brand->logo)}}" alt="" style="height: 30px">
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
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->is_new === 0 ? "No" : "Si"}}
                                </a>
                            </td>
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->is_preorder === 0 ? "No" : "Si"}}
                                </a>
                            </td>
                            <td>
                                <a href="{{route('comics.show', $comic->id)}}" class="text-decoration-none text-dark">
                                    {{$comic->discount > 0 ? $comic->discount . '%' : '-' }}
                                </a>
                            </td>
                            <td class="d-flex gap-2">
                                <!-- Button trigger modal edit-->
                            <button type="button" class="btn btn-bd-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editbackdrop{{$comic->id}}">
                                <i class="bi bi-pencil-fill"></i>
                            </button>
                                <!-- Button trigger modal delete-->
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
                                                <label for="slug" class="form-label">slug</label>
                                                <input type="text" class="form-control" id="slug" name="slug" value="{{$comic->slug}}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="brand_id" class="form-label">Brand</label>
                                                <select type="text" class="form-control" id="brand_id" name="brand_id">
                                                    @foreach ($brands as $brand)
                                                        <option value="{{$brand->id}}" {{$comic->brand_id == $brand->id ? "selected" : ""}}>{{$brand->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                @foreach ($characters as $character)
                                                <div class="d-inline-block me-3">
                                                    <input type="checkbox" name="characters[]" id="character-{{$character->id}}" value="{{$character->id}}" class="form-check-input" {{$comic->characters->contains($character->id) ? "checked" : ""}}>
                                                    <label for="character-{{$character->id}}" class="form-label">{{$character->name}}</label>
                                                </div>
                                                @endforeach
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
                                                <label for="is_new" class="form-label">Nuovo arrivo</label>
                                                <select type="text" class="form-control" id="is_new" name="is_new">
                                                    <option value="0" {{ !$comic->is_new ? 'selected' : '' }}>No</option>
                                                    <option value="1" {{ $comic->is_new ? 'selected' : '' }}>Sì</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="is_preorder" class="form-label">Preordine</label>
                                                 <select type="text" class="form-control" id="is_preorder" name="is_preorder">
                                                    <option value="0" {{ !$comic->is_new ? 'selected' : '' }}>No</option>
                                                    <option value="1" {{ $comic->is_new ? 'selected' : '' }}>Sì</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="discount" class="form-label">Sconto</label>
                                                <input type="text" class="form-control" id="discount" name="discount" value="{{ $comic->discount > 0 ? $comic->discount . '%' : '' }}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="img" class="form-label">Immagine</label>
                                                <input type="file" class="form-control" id="img" name="cover_img">
                                                @if ($comic->cover_img)
                                                    <img src="{{asset('img/' . $comic->cover_img)}}" alt="" class="w-50 h-50">
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
                    <input type="text" class="form-control" id="titolo" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="slug" class="form-label">Slug</label>
                    <input type="text" class="form-control" id="slug" name="slug" required>
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
                    @foreach ($characters as $character)
                    <div class="d-inline-block me-3">
                        <input type="checkbox" name="characters[]" id="character-{{$character->id}}" value="{{$character->id}}" class="form-check-input">
                        <label for="character-{{$character->id}}" class="form-label">{{$character->name}}</label>
                    </div>
                    
                    @endforeach
                </div>
                <div class="mb-3">
                    <label for="descrizione" class="form-label">Descrizione</label>
                    <textarea class="form-control" id="descrizione" name="description" rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label for="prezzo" class="form-label">Prezzo</label>
                    <input type="text" class="form-control" id="prezzo" name="price" required>
                </div>
                <div class="mb-3">
                    <label for="is_new" class="form-label">Nuovo Arrivo</label>
                    <select type="text" class="form-control" id="is_new" name="is_new">
                        <option value="0">No</option>
                        <option value="1">Si</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="is_preorder" class="form-label">Preordine</label>
                    <select type="text" class="form-control" id="is_preorder" name="is_preorder">
                        <option value="0">No</option>
                        <option value="1">Si</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="discount" class="form-label">Sconto</label>
                    <input type="text" class="form-control" id="discount" name="discount">
                </div>
                <div class="mb-3">
                    <label for="img" class="form-label">Immagine</label>
                    <input type="file" class="form-control" id="img" name="cover_img" required>
                </div>
                <div class="mb-3">
                    <label for="release_date" class="form-label">Data di pubblicazione</label>
                    <input type="text" class="form-control" id="release_date" name="release_date">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Chiudi</button>
                  <button type="submit" class="btn btn-outline-success">Salva</button>
                </div>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection