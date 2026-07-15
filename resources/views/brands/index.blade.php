@extends('layouts.app')

@section('content')
    <section>
        <div class="container mt-5">
            {{-- Button for modal create--}}
            <button type="button" class="btn btn-outline-primary my-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <i class="bi bi-plus-lg"></i>
            </button>
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nome</th>
                        <th scope="col">descrizione</th>
                        <th scope="col">Logo</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($brands as $index => $brand)
                    <tr>
                        <th scope="row">{{$index + 1}}</th>
                        <td>{{$brand->name}}</td>
                        <td>{{$brand->description}}</td>
                        <td>
                            <img src="{{asset('img/' . $brand->logo)}}" alt="" class="w-50 h-50
                            ">
                        </td>
                        <td>
                            <div class="d-flex gap-1">
                                <!-- Button trigger modal edit-->
                            <button type="button" class="btn btn-bd-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editbackdrop{{$brand->id}}">
                                <i class="bi bi-pencil-fill"></i>
                            </button>
                                <!-- Button trigger modal delete-->
                            <button type="button" class="btn btn-bd-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#deletemodal{{$brand->id}}">
                                <i class="bi bi-trash3-fill"></i>
                            </button>
                            </div>
                        </td>
                    </tr>

                     <!-- Modal edit-->
                            <div class="modal fade" id="editbackdrop{{$brand->id}}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modifica brand</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-control">
                                        <form action="{{route('brands.update', $brand->id)}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            @method('PUT')
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Nome</label>
                                                <input type="text" class="form-control" id="name" name="name" value="{{$brand->name}}">
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Descrizione</label>
                                                <textarea class="form-control" id="description" name="description" rows="2">{{$brand->description}}</textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="logo" class="form-label">Logo</label>
                                                <input type="file" class="form-control" id="logo" name="logo">
                                                @if ($brand->logo)
                                                    <img src="{{asset('storage/' . $brand->logo)}}" alt="" class="w-50 h-50">
                                                @endif
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
                            <div class="modal fade" id="deletemodal{{$brand->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body fw-semibold fs-4">
                                    Sei sicuro di voler eliminare {{$brand->name}}?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-dismiss="modal">Chiudi</button>
                                    <form action="{{route('brands.destroy', $brand->id)}}" method="POST">
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
            <form action="{{route('brands.store')}}" class="p-2" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                    <label for="name" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Descrizione</label>
                    <textarea class="form-control" id="description" name="description" rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label for="logo" class="form-label">Logo</label>
                    <input type="file" class="form-control" id="logo" name="logo">
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