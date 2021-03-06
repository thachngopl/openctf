(*
    OpenCTF - Component Test Framework
    Copyright (C) 2016 Michael Justin

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*)

unit ctfTestMenus;

interface

uses
  OpenCTF,
  TestFrameWork, Classes;

type
  TMenuItemHandler = class(TComponentHandler)
  protected
    function Accepts(const Component: TComponent): Boolean; override;
    procedure AddTests; override;
  end;

implementation
uses Menus;

{ TMenuItemHandler }

function TMenuItemHandler.Accepts(const Component: TComponent): Boolean;
begin
  Result := inherited Accepts(Component);

  // exclude menu items if they are separator lines or have submenu entries
  if Result then with TMenuItem(Component) do
    Result := (not IsLine) and (Count=0)
    
end;

procedure TMenuItemHandler.AddTests;
begin
  inherited;
  CheckProperties(['OnClick']);
end;

end.

