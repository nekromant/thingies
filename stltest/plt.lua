hpgl = {}
hpgl.__index = hpgl

function hpgl.new()
   local h = {}
   setmetatable(h,hpgl)
   return h
end

function hpgl:buffer_to_table(buffer)
   local tmp = {}
   local op
   for op in buffer:gmatch("([a-zA-Z0-9%s,]+)") do 
      table.insert(tmp, op) 
   end
   return tmp
end

function hpgl:load_from_file(filename)
   local buffer="";
   for f in io.lines(filename) do
      buffer=buffer..f;
   end
   return buffer
end

function hpgl:parse_op(op)
   local o
   local cmd = { }
   for j in op:gmatch("(%w+)") do 
      table.insert(cmd,j)
   end
   return cmd
end

function hpgl:lines_to_polygon(lines)
   
end

function hpgl:get_lines(ops)
   local lines = { }
   local pen_is_up = false;
   local prev
   for i,j in pairs(ops) do
      opcode = hpgl:parse_op(j)
      if opcode[1] == "PU" then
	 pen_up = true;
      end

      if opcode[1] == "PD" then
	 pen_up = false;
      end

      if opcode[1] == "PA" then
	 if opcode[2] ~= nil then
	    local current = { tonumber(opcode[2]), tonumber(opcode[3]) }
	    if (pen_up==false) then
	       table.insert(lines, { prev, current } )
	    end
	       prev = current
	 end
	 
      end
   end
   return lines
end

function hpgl:points_to_scad_polygon(points, height)
   local s_points="points = [\n"
   local s_num="paths = [\n"
   local pr=0
   for i,p in ipairs(points) do
      if pr~=0 then
	 s_num=s_num.."["..pr..","..i.."],\n";
	 print(i,p)
      end
      pr=i
      
      s_points=s_points.."["..tostring(p[1]/100)..tostring(",")..tostring(p[2]/100).."],\n"
      
   end
   print(s_points.."]\n\n")
   print(s_num.."]\n\n")

end


h = hpgl.new();
b = h:load_from_file("s-PCB_Edges.plt")
b = h:buffer_to_table(b);
lines = h:get_lines(b);
points = h:lines_to_polygon(lines)
h:points_to_scad_polygon(points);

