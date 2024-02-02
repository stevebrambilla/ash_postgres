defmodule AshPostgres.TestRepo.Migrations.InstallAshFunctionsExtension3 do
  @moduledoc """
  Installs any extensions that are mentioned in the repo's `installed_extensions/0` callback

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    execute("""
    CREATE OR REPLACE FUNCTION ash_raise_error(json_data jsonb)
    RETURNS BOOLEAN AS $$
    BEGIN
        -- Raise an error with the provided JSON data.
        -- The JSON object is converted to text for inclusion in the error message.
        RAISE EXCEPTION 'ash_error: %', json_data::text;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;
    """)

    execute("""
    CREATE OR REPLACE FUNCTION ash_raise_error(json_data jsonb, type_signal ANYCOMPATIBLE)
    RETURNS ANYCOMPATIBLE AS $$
    BEGIN
        -- Raise an error with the provided JSON data.
        -- The JSON object is converted to text for inclusion in the error message.
        RAISE EXCEPTION 'ash_error: %', json_data::text;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;
    """)
  end

  def down do
    # Uncomment this if you actually want to uninstall the extensions
    # when this migration is rolled back:
    execute("""
    CREATE OR REPLACE FUNCTION ash_raise_error(json_data jsonb)
    RETURNS BOOLEAN AS $$
    BEGIN
        -- Raise an error with the provided JSON data.
        -- The JSON object is converted to text for inclusion in the error message.
        RAISE EXCEPTION '%', json_data::text;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;
    """)

    execute("""
    CREATE OR REPLACE FUNCTION ash_raise_error(json_data jsonb, type_signal ANYCOMPATIBLE)
    RETURNS ANYCOMPATIBLE AS $$
    BEGIN
        -- Raise an error with the provided JSON data.
        -- The JSON object is converted to text for inclusion in the error message.
        RAISE EXCEPTION '%', json_data::text;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;
    """)
  end
end