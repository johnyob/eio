type 'a enqueue = ('a, exn) result -> unit

exception%effect Suspend : (Cancel.fiber_context -> 'a enqueue -> unit) -> 'a

let enter_unchecked fn = perform (Suspend fn)

let enter fn =
  enter_unchecked @@ fun fiber enqueue ->
  match Cancel.Fiber_context.get_error fiber with
  | None -> fn fiber enqueue
  | Some ex -> enqueue (Error ex)
