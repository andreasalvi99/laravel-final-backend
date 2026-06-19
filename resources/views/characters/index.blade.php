@extends('layouts.app')

@section('content')
    <section id="characters">
        <div class="container mt-5">
            {{-- Button for modal create--}}
            <button type="button" class="btn btn-outline-primary my-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <i class="bi bi-plus-lg"></i>
            </button>

            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Immagine</th>
                        <th scope="col">Nome</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($characters as $index => $character)
                    <tr>
                        <th scope="row">{{$index + 1}}</th>
                        <td>
                                <a href="{{route('characters.show', $character->id)}}">
                                    <img src="{{asset('storage/' . $character->character_img)}}" alt="" style="height: 80px; width: 75px" class="rounded-circle">
                                </a>
                            </td>
                            <td>
                                <a href="{{route('characters.show', $character->id)}}" class="text-decoration-none text-dark">
                                    {{$character->name}}
                                </a>
                            </td>
                            <td>
                                <div class="d-flex flex-column gap-1">
                                    <!-- Button trigger modal edit-->
                                    <button type="button" class="btn btn-bd-primary" data-bs-toggle="modal" data-bs-target="#editbackdrop{{$character->id}}">
                                        <i class="bi bi-pencil-fill"></i>
                                    </button>
                                        <!-- Button trigger modal delete-->
                                    <button type="button" class="btn btn-bd-secondary" data-bs-toggle="modal" data-bs-target="#deletemodal{{$character->id}}">
                                        <i class="bi bi-trash3-fill"></i>
                                    </button>
                                </div>
                            </td>
                    </tr>

                    <!-- Modal edit-->
                            <div class="modal fade" id="editbackdrop{{$character->id}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modifica personaggio</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-control">
                                        <form action="{{route('characters.update', $character->id)}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Nome</label>
                                                <input type="text" class="form-control" id="name" name="name" value="{{$character->name}}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Descrizione</label>
                                                <textarea class="form-control" id="description" name="description" rows="2">{{$character->description}}</textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="character_img" class="form-label">Immagine</label>
                                                <input type="file" class="form-control" id="character_img" name="character_img">
                                                @if ($character->character_img)
                                                    <img src="{{asset('storage/' . $character->character_img)}}" alt="" class="w-50 h-50">
                                                @endif
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

                            {{-- Modal delete --}}
                            <div class="modal fade" id="deletemodal{{$character->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body fw-semibold fs-4">
                                    Sei sicuro di voler eliminare {{$character->name}}?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Chiudi</button>
                                    <form action="{{route('characters.destroy', $character->id)}}" method="POST">
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
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Aggiungi personaggio</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-control"> 
            <form action="{{route('characters.store')}}" class="p-2" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="name" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                {{-- <div class="mb-3">
                    <label for="brand_id" class="form-label">Brand</label>
                    <select type="text" class="form-control" id="brand_id" name="brand_id">
                        @foreach ($brands as $brand)
                            <option value="{{$brand->id}}">{{$brand->name}}</option>
                        @endforeach
                    </select>
                </div> --}}
                <div class="mb-3">
                    <label for="description" class="form-label">Descrizione</label>
                    <textarea class="form-control" id="description" name="description" rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label for="character_img" class="form-label">Immagine</label>
                    <input type="file" class="form-control" id="character_img" name="character_img" required>
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