module Promise = Promise
module Fiber = Fiber
module Switch = Switch
module Cancel = Cancel
module Exn = Exn
module Private = struct
  module Suspend = Suspend
  module Waiters = Waiters
  module Ctf = Ctf
  module Fiber_context = Cancel.Fiber_context
  module Debug = Debug

  module Effects = struct
    type 'a enqueue = 'a Suspend.enqueue
    exception%effect Suspend = Suspend.Suspend
    exception%effect Fork = Fiber.Fork
    exception%effect Get_context = Cancel.Get_context
  end
end
