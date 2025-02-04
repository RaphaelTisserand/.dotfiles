local function Class(ClassName)
	-- Get the current working directory
	local current_dir = vim.fn.getcwd()

	-- Define the source directory (in 'srcs/class' folder in the current directory)
	local source_dir = current_dir .. "/srcs/class/"
	vim.fn.mkdir(source_dir, 'p')

	-- Editing the source file in the 'srcs/class' folder
	vim.cmd("e " .. source_dir .. ClassName .. ".cpp")

	-- Insert content into the source file
	local source_content = [[
#include "]] .. ClassName .. [[.hpp"

]] .. ClassName .. [[::]] .. ClassName .. [[( void ) {}

]] .. ClassName .. [[::]] .. ClassName .. [[( ]] .. ClassName .. [[ const & src ) {}

]] .. ClassName .. [[::~]] .. ClassName .. [[( void ) {}

]] .. ClassName .. [[&	]] .. ClassName .. [[::operator=( ]] .. ClassName .. [[ const & rhs ) {
	if ( this != &rhs ) {}

	return *this;
}

std::ostream&	operator<<( std::ostream& o, ]] .. ClassName .. [[ const & rhs ) {
	o << "]] .. ClassName .. [[ redirection operator not set";

	return o;
}]]

	-- Insert source content
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(source_content, "\n"))

	-- Save the source file
	vim.cmd("write")

	-- Define the header directory (in 'incs' folder in the current directory)
	local header_dir = current_dir .. "/incs/"
	vim.fn.mkdir(header_dir, 'p') -- Create the directory if it doesn't exist

	-- Editing the header file in the 'incs' folder
	vim.cmd("vsp " .. header_dir .. ClassName .. ".hpp")

	-- Insert content into the header file
	local header_content = [[
#pragma once

#include <iostream>
#include <string>

class ]] .. ClassName .. [[ {
private:

public:
	]] .. ClassName .. [[( void );
	]] .. ClassName .. [[( ]] .. ClassName .. [[ const & src );
	virtual ~]] .. ClassName .. [[( void );

	]] .. ClassName .. [[&	operator=( ]] .. ClassName .. [[ const & rhs );
};

std::ostream&	operator<<( std::ostream& o, ]] .. ClassName .. [[ const & rhs );]]

	-- Insert header content
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(header_content, "\n"))

	-- Save the header file
	vim.cmd("write")
end

-- Bind the function to a command (optional)
vim.api.nvim_create_user_command('CppClass', function(opts)
	Class(opts.args)
end, { nargs = 1 })
