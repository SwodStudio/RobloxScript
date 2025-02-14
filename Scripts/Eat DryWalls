--// MADE BY MAXXUS \\--

--\\ PRESS Q 2 STOP //--


while task.wait() do
   local drywallChildren = game:GetService("Workspace").House1.Drywall:GetChildren()
   local randomIndex = math.random(1, #drywallChildren)
   local drywall = drywallChildren[randomIndex]

   if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Q) then
       break
   end

   if drywall then
       local args = {
           [1] = drywall.Position,
           [2] = Vector3.new(-11.421236991882324, 11.724608421325684, -41.96101760864258)
       }
       game:GetService("ReplicatedStorage"):WaitForChild("DrywallClicked"):FireServer(unpack(args))
   end
end
